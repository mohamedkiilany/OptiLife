import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/final_wizard/widgets/body_metrics_section.dart';
import 'package:optilife_app/features/final_wizard/widgets/info_box.dart';
import 'package:optilife_app/features/final_wizard/widgets/onboarding_fitness_level_card.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';

class FitnessBaselinePage extends StatefulWidget {
  const FitnessBaselinePage({super.key});

  @override
  State<FitnessBaselinePage> createState() => _FitnessBaselinePageState();
}

class _FitnessBaselinePageState extends State<FitnessBaselinePage> {
  final int step = 7;
  String selectedFitnessLevel = 'beginner';

  final Color primaryGreen = const Color(0xFF006E2F);
  final Color selectedGreen = const Color(0xFF20C765);
  final Color iconBackground = const Color(0xFFEAEDFF);
  final Color textColor = const Color(0xFF192238);

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
                    onTap: () => context.go(AppRouter.diet),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Step 7 Personal Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            const LinearProgressIndicator(
              value: 7 / 8,
              color: AppColors.primaryGreen,
              backgroundColor: AppColors.white,
              minHeight: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const WizardScreenChip(
                            icon: Icons.monitor_heart_outlined,
                            text: 'CAPACITY & BASELINE',
                          ),
                          const Text(
                            'Step 7 of 8',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "What's your current fitness baseline?",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 30,
                          height: 1.15,
                          color: AppColors.darkText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'We calibrate starting intensity to prevent burnout and joint strain.',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 18),
                      FitnessLevelCard(
                        id: 'beginner',
                        title: 'Beginner / Returning',
                        badge: 'Gentle',
                        description: 'Little to no recent routine. Focus on mobility, safe form, and low impact movements.',
                        icon: Icons.spa_outlined,
                        isChosen: selectedFitnessLevel == 'beginner',
                        onTap: () {
                          setState(() {
                            selectedFitnessLevel = 'beginner';
                          });
                        },
                      ),

                      const SizedBox(height: 10),
                      FitnessLevelCard(
                        id: 'intermediate',
                        title: 'Intermediate',
                        description: 'Consistent 1-3 times a week. Comfortable with compound movements and active tempo.',
                        icon: Icons.directions_run,
                        isChosen: selectedFitnessLevel == 'intermediate',
                        onTap: () {
                          setState(() {
                            selectedFitnessLevel = 'intermediate';
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      FitnessLevelCard(
                        id: 'advanced',
                        title: 'Advanced / Athlete',
                        description: 'High work capacity. Looking for progressive overload and metabolic conditioning.',
                        icon: Icons.bolt,
                        isChosen: selectedFitnessLevel == 'advanced',
                        onTap: () {
                          setState(() {
                            selectedFitnessLevel = 'advanced';
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      const BodyMetricsSection(),
                      const SizedBox(height: 20),
                      InfoBox(
                        icon: Icons.tune,
                        iconSize: 24,
                        backgroundColor: AppColors.screenchipBg.withOpacity(
                          0.3,
                        ),
                        textColor: Color(0xff006F67),
                        borderRadius: 12,
                        text: 'Baseline dynamically scales during your first 14 days as we observe your recovery speed.',
                        horizontalPadding: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ProgressContinueButton(
              onPressed: () {
                if (selectedFitnessLevel.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Please select what fits you best.'),
                      backgroundColor: AppColors.primaryTeal,
                    ),
                  );
                  return;
                }
                context.go(AppRouter.kitchen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
