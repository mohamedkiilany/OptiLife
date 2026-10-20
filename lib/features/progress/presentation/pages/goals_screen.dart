import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/data/progress_options.dart';
import 'package:optilife_app/features/progress/presentation/controllers/progress_selection_controller.dart';

import 'package:optilife_app/features/progress/presentation/widgets/goal_option_card.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final _selection = ProgressSelectionController();

  @override
  void dispose() {
    _selection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.background,
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.go(AppRouter.signup),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Step 1 Goal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          const LinearProgressIndicator(
            value: 1 / 8,
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCCF5EC),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.chevron_left,
                              color: AppColors.primaryTeal,
                            ),
                            Text(
                              'PERSONALIZED BLUEPRINT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryTeal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Step 1 of 8',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "What's your primary wellness goal?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "We'll adapt routine intensity, meal macros, and daily pace to this target.",
                    style: TextStyle(fontSize: 15, color: AppColors.muted),
                  ),
                  const SizedBox(height: 20),
                  ListenableBuilder(
                    listenable: _selection,
                    builder: (context, _) => Column(
                      children: [
                        for (var i = 0; i < goalOptions.length; i++)
                          GoalOptionCard(
                            option: goalOptions[i],
                            selected: _selection.selectedIndex == i,
                            onTap: () => _selection.select(i),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E4FF),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.lock_outline,
                              color: AppColors.primaryGreen,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Zero judgment promise:',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'You can switch your primary goal or fine-tune daily priorities anytime in your profile settings without losing historical progress.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.muted,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListenableBuilder(
            listenable: _selection,
            builder: (context, _) => ProgressContinueButton(
              onPressed: () {
                if (!_selection.hasSelection) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      content: const Text('Please select a goal first'),
                      backgroundColor: AppColors.primaryTeal,
                    ),
                  );
                  return;
                }
                context.go(AppRouter.availableTime);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
