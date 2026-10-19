import 'package:flutter/material.dart';
import 'package:optilife_app/pages/food_avaialbility.dart';
import 'package:optilife_app/widgets/body_metrics_section.dart';
import 'package:optilife_app/widgets/custom_button.dart';
import 'package:optilife_app/widgets/info_box.dart';
import 'package:optilife_app/widgets/onboarding_fitness_level_card.dart';
import 'package:optilife_app/widgets/onboarding_header.dart';
import 'package:optilife_app/widgets/onboarding_step_indicator.dart';

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
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: OnboardingHeader(
        title: 'Profile Setup Personal Details',
        progressValue: step / 8,
        onSkipPressed: () {},
        onProfilePressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OnboardingStepIndicator(
                  step: step,
                  title: 'CAPACITY & BASELINE',
                ),
                const SizedBox(height: 16),
                Text(
                  "What's your current fitness baseline?",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    height: 1.15,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'We calibrate starting intensity to prevent burnout and joint strain.',
                  style: TextStyle(
                    color: Color(0xFF3D4A3D),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
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
                const SizedBox(height: 30),
                const BodyMetricsSection(),
                const SizedBox(height: 30),
                InfoBox(
                  icon: Icons.tune,
                  iconSize: 24,
                  backgroundColor: Color(0xff99EFE5).withOpacity(0.3),
                  textColor: Color(0xff006F67),
                  borderRadius: 12,
                  text: 'Baseline dynamically scales during your first 14 days as we observe your recovery speed.',
                  horizontalPadding: 16,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Continue ',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FoodAvaialbility(),
                      ),
                    );
                  }, icon: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
