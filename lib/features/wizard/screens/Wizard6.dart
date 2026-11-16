import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';
import 'package:optilife_app/features/wizard/widgets/dietary_preference_chip.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';

class Dietry extends StatefulWidget {
  const Dietry({super.key});

  @override
  State<Dietry> createState() => _DietryState();
}

class _DietryState extends State<Dietry> {
  static const _preferences = [
    '♧ No preference',
    '🥩 Halal',
    '💪 High protein',
    '🥗 Vegetarian',
    '🥑 Low carb',
    '🌱 Vegan',
    '🥛 Dairy-free',
    '🌾 Gluten-free',
    '⚠️ Nut allergy',
    '🐟 Pescatarian',
  ];

  final Set<String> _selectedPreferences = {};
  final List<String> _dislikedIngredients = [];
  final TextEditingController _ingredientController = TextEditingController();

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    final ingredient = _ingredientController.text.trim();
    if (ingredient.isEmpty ||
        _dislikedIngredients.any(
          (existing) => existing.toLowerCase() == ingredient.toLowerCase(),
        )) {
      return;
    }

    setState(() {
      _dislikedIngredients.add(ingredient);
      _ingredientController.clear();
    });
  }

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
                    _buildPreferencesSection(),
                    const SizedBox(height: 16),
                    _buildDislikesSection(),
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
            ProgressContinueButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Select what fits you best',
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Multiple choice',
              style: TextStyle(color: AppColors.muted, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _preferences.map((preference) {
            final selected = _selectedPreferences.contains(preference);
            return DietaryPreferenceChip(
              label: preference,
              isSelected: selected,
              onTap: () {
                setState(() {
                  if (selected) {
                    _selectedPreferences.remove(preference);
                  } else {
                    _selectedPreferences.add(preference);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDislikesSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Foods you dislike or avoid',
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text('Optional', style: TextStyle(color: AppColors.muted)),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "Ingredients you don't enjoy eating. We'll automatically replace them with equal macro swaps.",
            style: TextStyle(color: AppColors.muted, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ingredientController,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _addIngredient(),
                  decoration: InputDecoration(
                    hintText: 'e.g. Cilantro, olives, mushrooms',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _addIngredient,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryTeal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (_dislikedIngredients.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _dislikedIngredients.map((ingredient) {
                return Chip(
                  label: Text(ingredient),
                  onDeleted: () =>
                      setState(() => _dislikedIngredients.remove(ingredient)),
                );
              }).toList(),
            ),
          ],
        ],
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
