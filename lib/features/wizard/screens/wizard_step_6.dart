import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';
import 'package:optilife_app/features/wizard/widgets/dislike_section.dart';
import 'package:optilife_app/features/wizard/widgets/dite_preference_section.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';

class Dietry extends StatefulWidget {
  const Dietry({super.key});

  @override
  State<Dietry> createState() => _DietryState();
}

class _DietryState extends State<Dietry> {
  final Set<String> _selectedPreferences = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.go(AppRouter.budget),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Step 6 Dietary Preferences',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            const LinearProgressIndicator(
              value: 6 / 8,
              color: AppColors.primaryGreen,
              backgroundColor: AppColors.white,
              minHeight: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const WizardScreenChip(
                          icon: Icons.restaurant_menu,
                          text: 'NUTRITION CALIBRATION',
                        ),
                        const Text(
                          'Step 6 of 8',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Any dietary preferences or allergies?',
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'We tailor meals and grocery plans around your lifestyle, cultural traditions, and health needs.',
                      style: TextStyle(color: AppColors.muted, fontSize: 15),
                    ),
                    const SizedBox(height: 18),
                    DitePreferenceSection(
                      onSelectionChanged: (preferences) {
                        _selectedPreferences
                          ..clear()
                          ..addAll(preferences);
                      },
                    ),
                    const SizedBox(height: 16),
                    DislikeSection(
                      onChanged: context.read<SelectionCubit>().setDislikedFoods,
                    ),
                    const SizedBox(height: 16),
                    const _InfoCard(
                      icon: Icons.sync,
                      iconBackground: Color(0xFFA5EFE8),
                      iconColor: Color(0xFF00695C),
                      background: Color(0xFFD3F5F5),
                      title: 'Zero Food Waste Guarantee',
                      description: 'Swap or modify ingredients on any planned day. Your daily calories, fiber, and target macros recalculate instantly.',
                    ),
                    const SizedBox(height: 12),
                    const _RecipeSummaryCard(),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            ProgressContinueButton(
              onPressed: () {
                if (_selectedPreferences.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Please select what fits you best.'),
                      backgroundColor: AppColors.primaryTeal,
                    ),
                  );
                  return;
                }
                context.read<SelectionCubit>().setDietPreferences(_selectedPreferences);
                context.go(AppRouter.fitness);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final Color background;
  final String title;
  final String description;

  const _InfoCard({
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    required this.background,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconBackground,
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecipeSummaryCard extends StatelessWidget {
  const _RecipeSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFD4F0DD),
            radius: 20,
            child: Icon(Icons.restaurant, color: Color(0xFF1B5E20), size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Curating 340+ compliant recipes',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  'Halal-certified sources • High lean-protein',
                  style: TextStyle(color: AppColors.muted, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
