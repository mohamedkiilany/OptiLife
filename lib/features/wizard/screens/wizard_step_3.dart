import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';
import 'package:optilife_app/features/wizard/screens/wizard_step_4.dart';
import 'package:optilife_app/features/wizard/widgets/quiet_apartment_mode.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';
import 'package:optilife_app/features/wizard/widgets/workout_card_chip.dart';
import 'package:optilife_app/features/wizard/widgets/select_card.dart';

class WizardStep3 extends StatefulWidget {
  const WizardStep3({super.key});

  @override
  State<WizardStep3> createState() => _WizardStep3();
}

class _WizardStep3 extends State<WizardStep3> {
  @override
  Widget build(BuildContext context) {
    SelectionCubit cubit = context.read<SelectionCubit>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Wizard Step 3 Training \nEnvironment',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_rounded)),
          TextButton(
            onPressed: () {
              cubit.skipEnvironments();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WizardStep4()),
              );

              print(cubit.state.environments);
            },
            child: Text('Skip', style: TextStyle(color: AppColors.darkGreen)),
          ),
          CircleAvatar(
            backgroundColor: AppColors.darkGreen,
            foregroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outline),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: BlocBuilder<SelectionCubit, SelectionState>(
          builder: (context, state) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WizardScreenChip(
                        icon: Icons.explore,
                        text: 'TRAINING ENVIRONMENT',
                      ),
                      Text(
                        'Where will you work out?',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Select all locations that apply. We adapt sound levels,floor space, and equipment setups seamlessly.',
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
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
                                style: TextStyle(color: AppColors.darkGreen),
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
                      if (cubit.state.environments.contains('Home / Apartment'))
                        QuietApartmentMode(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
          onPressed: () {
            if (cubit.state.environments.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WizardStep4()),
              );
              print(cubit.state.environments);
            } else {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Please select at least one option to continue.',
                  ),
                ),
              );
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: AppColors.lightGreen,
            foregroundColor: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Continue', style: TextStyle(fontSize: 20)),
              SizedBox(width: 5),
              Icon(size: 20, Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}


