import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optilife_app/core/models/fridge_scan_result.dart';
import 'package:optilife_app/core/services/gemini_scan_service.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/home/presentation/widgets/custom_button.dart';
import 'package:optilife_app/features/home/presentation/widgets/info_chips.dart';
import 'package:optilife_app/features/profile/data/profile_repository.dart';
import 'package:optilife_app/features/profile/model/user_profile.dart';

class FridgeScannerPage extends StatefulWidget {
  const FridgeScannerPage({super.key});

  @override
  State<FridgeScannerPage> createState() => _FridgeScannerPageState();
}

class _FridgeScannerPageState extends State<FridgeScannerPage> {
  final _scanner = GeminiScanService();
  final _picker = ImagePicker();

  File? _image;
  FridgeScanResult? _result;
  String? _error;
  bool _loading = false;

  Future<FridgeScanResult> _runScan() async {
    final sw = Stopwatch()..start();
    UserProfile? profile;
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        profile = await ProfileRepository()
            .fetch(uid)
            .timeout(const Duration(seconds: 8));
      }
      debugPrint('SCAN: profile ok in ${sw.elapsedMilliseconds}ms');
    } catch (e) {
      debugPrint('SCAN: profile failed ($e), continuing without it');
    }
    try {
      final res = await _scanner.scanFridge(_image!, profile: profile);
      debugPrint('SCAN: gemini ok in ${sw.elapsedMilliseconds}ms');
      return res;
    } catch (e) {
      debugPrint('SCAN: gemini failed after ${sw.elapsedMilliseconds}ms: $e');
      rethrow;
    }
  }

  Future<void> _scan() async {
    setState(() {
      _result = null;
      _error = null;
      _loading = true;
    });
    try {
      final res = await _runScan();
      if (!mounted) return;
      setState(() => _result = res);
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = _friendlyError(e));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _pick(ImageSource source) async {
    if (_loading) return;
    final picked = await _picker.pickImage(
      source: source,
      maxWidth: 1280,
      imageQuality: 80,
    );
    if (picked == null) return;
    setState(() => _image = File(picked.path));
    await _scan();
  }

  String _friendlyError(Object e) {
    if (e is TimeoutException) {
      return 'This is taking too long. Check your connection and try again.';
    }
    if (e is SocketException) {
      return 'No internet connection. Please try again.';
    }
    final msg = e.toString().toLowerCase();
    if (msg.contains('quota') || msg.contains('429')) {
      return 'The scanner is busy right now. Try again in a minute.';
    }
    return "Couldn't scan the image. Please try again with a clearer photo.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(title: const Text('What Can I Make?'), centerTitle: true),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _imageBox(),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Take a Photo',
              icon: Icons.camera_alt_outlined,
              onTap: () => _pick(ImageSource.camera),
            ),
            const SizedBox(height: 8),
            CustomButton(
              text: 'Choose from Gallery',
              icon: Icons.photo_library_outlined,
              onTap: () => _pick(ImageSource.gallery),
            ),
            const SizedBox(height: 16),
            if (_loading)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              ),
            if (_error != null) ...[
              _errorBox(),
              if (_image != null && !_loading)
                TextButton.icon(
                  onPressed: _scan,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try again'),
                ),
            ],
            if (_result != null) ..._resultWidgets(_result!),
          ],
        ),
      ),
    );
  }

  Widget _imageBox() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: _image == null
          ? const Center(
              child: Text(
                'Take a photo of your fridge\nor the ingredients you have',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.muted),
              ),
            )
          : Image.file(_image!, fit: BoxFit.cover, width: double.infinity),
    );
  }

  Widget _errorBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(_error!, style: TextStyle(color: Colors.red.shade800)),
    );
  }

  List<Widget> _resultWidgets(FridgeScanResult r) {
    return [
      const Text('Detected ingredients',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: r.ingredients
            .map((i) => InfoChip(
                  icon: Icons.check_circle_outline,
                  iconColor: AppColors.darkGreen,
                  text: i,
                  textColor: AppColors.darkGreen,
                  backgroundColor: AppColors.selectedCardIcon,
                ))
            .toList(),
      ),
      const SizedBox(height: 20),
      const Text('You can make',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      const SizedBox(height: 8),
      if (r.recipes.isEmpty) const Text('No recipes found, try another photo.'),
      ...r.recipes.map(_recipeCard),
    ];
  }

  Widget _recipeCard(FridgeRecipe m) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(m.name,
                style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  InfoChip(
                    icon: Icons.local_fire_department_outlined,
                    iconColor: AppColors.darkGreen,
                    text: '${m.calories} kcal',
                    textColor: AppColors.darkGreen,
                  ),
                  InfoChip(
                    icon: Icons.timer_outlined,
                    iconColor: AppColors.darkGreen,
                    text: '${m.prepMinutes} min',
                    textColor: AppColors.darkGreen,
                  ),
                  InfoChip(
                    icon: Icons.payments_outlined,
                    iconColor: AppColors.darkGreen,
                    text: '~${m.estimatedCost.toStringAsFixed(0)} EGP',
                    textColor: AppColors.darkGreen,
                  ),
                ],
              ),
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  InfoChip(
                    text: 'Protein ${m.protein.round()}g',
                    textColor: AppColors.navy,
                  ),
                  InfoChip(
                    text: 'Carbs ${m.carbs.round()}g',
                    textColor: AppColors.navy,
                  ),
                  InfoChip(
                    text: 'Fat ${m.fat.round()}g',
                    textColor: AppColors.navy,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (m.missingIngredients.isNotEmpty) ...[
                Text('Missing: ${m.missingIngredients.join(', ')}',
                    style: TextStyle(color: Colors.orange.shade800)),
                const SizedBox(height: 8),
              ],
              Text(m.preparation),
            ],
          ),
        ),
      ),
    );
  }
}