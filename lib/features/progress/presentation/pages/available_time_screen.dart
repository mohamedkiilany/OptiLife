import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/data/progress_options.dart';
import 'package:optilife_app/features/progress/presentation/controllers/progress_selection_controller.dart';
import 'package:optilife_app/features/progress/presentation/widgets/goal_option_card.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_info_widgets.dart';
import 'package:optilife_app/features/progress/presentation/widgets/time_option_card.dart';

class AvailableTimeScreen extends StatefulWidget {
  const AvailableTimeScreen({super.key});

  @override
  State<AvailableTimeScreen> createState() => _AvailableTimeScreenState();
}

class _AvailableTimeScreenState extends State<AvailableTimeScreen> {
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => context.go(AppRouter.goal),
                  child: const Icon(Icons.arrow_back),
                ),
                SizedBox(width: 20),
                const Text(
                  'Step 2 Available Time',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          const LinearProgressIndicator(
            value: 2 / 8,
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
                        child: const Text(
                          '🕒 REALISTIC TIME COMMITMENT',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTeal,
                          ),
                        ),
                      ),
                      const Text(
                        'Step 2 of 8',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'How much time can you give per day?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Workouts and meal preps are strictly calibrated to fit this window. No unrealistic expectations.',
                    style: TextStyle(fontSize: 15, color: AppColors.muted),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        ProgressInfoTile(
                          label: 'Paced For',
                          value: 'Sustainable Pace',
                        ),
                        SizedBox(width: 8),
                        ProgressInfoTile(
                          label: 'Adaptability',
                          value: 'Flex Schedules',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListenableBuilder(
                    listenable: _selection,
                    builder: (context, _) => Column(
                      children: [
                        for (var i = 0; i < availableTimeOptions.length; i++)
                          TimeOptionCard(
                            option: availableTimeOptions[i],
                            selected: _selection.selectedIndex == i,
                            onTap: () => _selection.select(i),
                          ),
                      ],
                    ),
                  ),
                  const ProgressNotice(
                    background: Color(0xFFE0E4FF),
                    iconBackground: Color.fromARGB(255, 237, 209, 160),
                    icon: Icons.lightbulb,
                    iconColor: Color(0xFF5B3A00),
                    title: 'Busy day surprise?',
                    message: 'You can tap “I only have 10m” on any morning and OptiLife instantly scales your plan down without breaking streaks.',
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        ProgressConsistencyScore(),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '9 out of 10 members',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Stay consistent past 90 days when starting with 20 minutes or fewer.',
                                style: TextStyle(fontSize: 13),
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
          ProgressContinueButton(onPressed: () {}),
        ],
      ),
    ),
  );
}
