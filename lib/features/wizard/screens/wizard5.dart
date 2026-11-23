import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/profile/data/save_step.dart';
// import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';
import 'package:optilife_app/features/wizard/widgets/budget_card.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  String? selectedBudget;

  void _selectBudget(String title) {
    setState(() => selectedBudget = title);
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
                    onTap: () => context.go(AppRouter.equipment),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Step 5 Food Budget',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            const LinearProgressIndicator(
              value: 5 / 8,
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
                          icon: Icons.tune,
                          text: 'BUDGET CALIBRATION',
                        ),
                        const Text(
                          'Step 5 of 8',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "What's your grocery budget?",
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'We recommend ingredients you can actually afford without breaking the bank.',
                      style: TextStyle(color: AppColors.muted, fontSize: 15),
                    ),
                    const SizedBox(height: 10),
                    BudgetCard(
                      title: 'Budget-Conscious',
                      subtitle: 'Maximum Value Per Dollar',
                      weeklyBudget: r'$30 – $50',
                      mealBudget: r'~$2.00–$3.50 / meal',
                      description: 'Focuses on bulk staples, canned beans, seasonal vegetables, eggs, and smart protein swaps.',
                      tags: const ['Saves ~\$210/mo', 'Bulk-Friendly'],
                      isSelected: selectedBudget == 'Budget-Conscious',
                      onTap: () => _selectBudget('Budget-Conscious'),
                    ),
                    BudgetCard(
                      title: 'Moderate & Flexible',
                      subtitle: 'Most Popular Choice',
                      weeklyBudget: r'$50 – $80',
                      mealBudget: r'~$4.00–$6.50 / meal',
                      description: 'Balanced whole foods, poultry, fresh produce, and occasional specialty pantry items.',
                      tags: const ['High Variety', 'Fresh Greens'],
                      isSelected: selectedBudget == 'Moderate & Flexible',
                      onTap: () => _selectBudget('Moderate & Flexible'),
                    ),
                    BudgetCard(
                      title: 'Premium / Organic',
                      subtitle: 'Cleanest Whole Sourcing',
                      weeklyBudget: r'$80+',
                      mealBudget: r'$7.00+ / meal',
                      description: 'Wild-caught fish, organic meats, specialty superfoods, and premium health items.',
                      tags: const [
                        '100% Organic Priority',
                        'Wild-Caught Sourced',
                      ],
                      isSelected: selectedBudget == 'Premium / Organic',
                      onTap: () => _selectBudget('Premium / Organic'),
                    ),
                    const SizedBox(height: 4),
                    _SmartIngredientSwapsNotice(),
                    // const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            ProgressContinueButton(
              onPressed: () {
                if (selectedBudget == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Please select a grocery budget.'),
                      backgroundColor: AppColors.primaryTeal,
                    ),
                  );
                  return;
                }
                context.read<SelectionCubit>().setBudget(selectedBudget!);
               context.saveAndGo({'budget': selectedBudget}, AppRouter.diet);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SmartIngredientSwapsNotice extends StatelessWidget {
  const _SmartIngredientSwapsNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE3C2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.swap_horiz, color: Color(0xFF92400E)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    const Text(
                      'Smart Ingredient Swaps',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF854D0E),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E4FF),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'ACTIVE',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Our engine automatically suggests nutrient-dense, high-protein alternatives whenever a recipe ingredient exceeds your target meal budget.',
                  style: TextStyle(height: 1.5, color: Color(0xFF475569)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
