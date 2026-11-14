import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';
import 'package:optilife_app/features/wizard/widgets/quiet_apartment_mode.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';
import 'package:optilife_app/features/wizard/widgets/workout_card_chip.dart';
import 'package:optilife_app/features/wizard/widgets/select_card.dart';

class TrainingEnv extends StatefulWidget {
  const TrainingEnv({super.key});

  @override
  State<TrainingEnv> createState() => _TrainingEnv();
}

class _TrainingEnv extends State<TrainingEnv> {
  @override
  Widget build(BuildContext context) {
    SelectionCubit cubit = context.read<SelectionCubit>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: BlocBuilder<SelectionCubit, SelectionState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.go(AppRouter.availableTime),
                        child: const Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 20),
                      const Text(
                        'Step 3 Training Environment',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const LinearProgressIndicator(
                  value: 3 / 8,
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
                            WizardScreenChip(
                              icon: Icons.explore,
                              text: 'TRAINING ENVIRONMENT',
                            ),
                            const Text(
                              'Step 3 of 8',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Where will you work out?',
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Select all locations that apply. We adapt sound levels,floor space, and equipment setups seamlessly.',
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueBox,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: AppColors.darkGreen,
                                  ),
                                  SizedBox(width: 2),
                                  SizedBox(width: 2),
                                  Text('Multi-select enabled'),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Pick 1 or more',
                                  style: TextStyle(
                                    color: AppColors.primaryTeal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SelectCard(
                          type: SelectType.environments,
                          title: 'Home / Apartment',
                          imagePath: 'assets/images/workout_at_home.jpg',
                          description: 'Zero jumping & low noise options available.Ideal for living rooms or small',
                          firstChip: WorkoutCardChip(
                            chipLogo: Text('🏠'),
                            chipText: 'At Home',
                          ),
                          secondChip: WorkoutCardChip(
                            chipLogo: Icon(Icons.trending_down),
                            chipText: 'Low Impact',
                          ),
                        ),
                        SelectCard(
                          type: SelectType.environments,
                          title: 'Commercial Gym',
                          imagePath: 'assets/images/commercial_gym_icon.jpg',
                          description: 'Full access to machines, benches, and free weights for dedicated strength',
                          firstChip: WorkoutCardChip(
                            chipLogo: Text('🏋️'),
                            chipText: 'Full Gear',
                          ),
                          secondChip: WorkoutCardChip(
                            chipLogo: Text('⏱'),
                            chipText: '45-60 min',
                          ),
                        ),
                        SelectCard(
                          type: SelectType.environments,
                          title: 'Outdoors & Parks',
                          imagePath: 'assets/images/outdoor_workout_icon.jpg',
                          description: 'Fresh air bodyweight circuits, running routes, and open-air stretching.',
                          firstChip: WorkoutCardChip(
                            chipLogo: Text('🌳'),
                            chipText: 'Open Air',
                          ),
                          secondChip: WorkoutCardChip(
                            chipLogo: Text('👟'),
                            chipText: 'No Equipmentt',
                          ),
                        ),
                        if (cubit.state.environments.contains(
                          'Home / Apartment',
                        ))
                          QuietApartmentMode(),
                      ],
                    ),
                  ),
                ),
                ProgressContinueButton(
                  onPressed: () {
                    if (cubit.state.environments.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            'Please select at least one training environment.',
                          ),
                          backgroundColor: AppColors.primaryTeal,
                        ),
                      );
                      return;
                    }
                    context.go(AppRouter.equipment);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
