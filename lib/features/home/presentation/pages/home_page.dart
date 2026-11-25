import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:optilife_app/features/home/presentation/widgets/calorie_progress_card.dart';
import 'package:optilife_app/features/home/presentation/widgets/custom_button.dart';
import 'package:optilife_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:optilife_app/features/home/presentation/widgets/hydration_card.dart';
import 'package:optilife_app/features/home/presentation/widgets/info_chips.dart';
import 'package:optilife_app/features/home/presentation/widgets/plan_banner.dart';
import 'package:optilife_app/features/home/presentation/widgets/quick_solvers_section.dart';
import 'package:optilife_app/features/home/presentation/widgets/recovery_tip_card.dart';
import 'package:optilife_app/features/home/presentation/widgets/todays_constraints_card.dart';
import 'package:optilife_app/features/home/presentation/widgets/todays_meals_section.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  String get _formattedDate =>
      DateFormat('EEEE, MMM d').format(DateTime.now()).toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoChip(
                    icon: Icons.calendar_today,
                    iconColor: AppColors.darkGreen,
                    text: _formattedDate,
                    textColor: AppColors.darkGreen,
                  ),
                  InfoChip(
                    icon: Icons.local_fire_department,
                    iconColor: Color(0xFFEF9900),
                    text: '6-Day Streak',
                    textColor: Color(0xFF855300),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Good morning,\nMohamed',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Ready for sustainable wellness made for your real routine?',
                style: TextStyle(
                  color: AppColors.muted,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              const TodaysConstraintsCard(),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(Icons.fitness_center, color: AppColors.darkGreen),
                  SizedBox(width: 8),
                  Text(
                    "Today's Plan",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                  Spacer(),
                  InfoChip(
                    text: 'SMART MATCH',
                    textColor: Color(0xFF006E2F),
                    backgroundColor: AppColors.unSelectedCard,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Card(
                color: AppColors.white,
                child: Column(
                  children: [
                    const PlanBanner(),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoChip(
                          icon: Icons.apartment,
                          iconColor: AppColors.darkGreen,
                          text: 'No jumping (apartment \nfriendly)',
                          textColor: AppColors.darkGreen,
                          backgroundColor: AppColors.white,
                        ),
                        InfoChip(
                          text: 'Zero Equipment',
                          textColor: AppColors.muted,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomButton(
                        text: 'Start Workout',
                        onTap: () {},
                        icon: Icons.arrow_forward,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightBlueBox,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Daily Rhythm ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'Real-time sync',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: AppColors.muted,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 8),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 5,
                            child: CalorieProgressCard(
                              currentCalories: 1210,
                              goalCalories: 1800,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                HydrationCard(
                                  currentLiters: 2.1,
                                  goalLiters: 2.5,
                                ),
                                SizedBox(height: 10),
                                RecoveryTipCard(
                                  message: 'On track for the optimal recovery window tonight!',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              const TodaysMealsSection(),
              const SizedBox(height: 24),
              const QuickSolversSection(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
