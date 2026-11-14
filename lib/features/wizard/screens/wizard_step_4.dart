import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';
import 'package:optilife_app/features/wizard/screens/wizard_step_3.dart';
import 'package:optilife_app/features/wizard/widgets/adaptability_card.dart';
import 'package:optilife_app/features/wizard/widgets/select_card.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';
import 'package:optilife_app/features/wizard/widgets/zero_barrier_card.dart';

class WizardStep4 extends StatefulWidget {
  const WizardStep4({super.key});

  @override
  State<WizardStep4> createState() => _WizardStep4State();
}

class _WizardStep4State extends State<WizardStep4> {
  @override
  Widget build(BuildContext context) {
    SelectionCubit cubit = context.read<SelectionCubit>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Wizard Step 4 Training \nEnvironment',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.help_outline_rounded)),
          TextButton(
            onPressed: () {
              cubit.skipEquipment();
              print(cubit.state.equipment);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WizardStep3()),
              );
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WizardScreenChip(
                        icon: Icons.fitness_center,
                        text: 'EQUIPMENT CHECK',
                      ),
                      Text(
                        'What equipment do you have?',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Don\'t buy anything new. We design your program around what you already own.',
                      ),
                      SizedBox(height: 20),
                      SelectCard(
                        type: SelectType.equipment,
                        title: 'None (Bodyweight Only)',
                        icon: Icons.accessibility_new,
                        fontSize: 18,
                        description: 'Use your own body, floor mat, or furniture. 100% equipment-free workouts.',
                      ),
                      SelectCard(
                        type: SelectType.equipment,
                        title: 'Dumbbells / Kettlebells',
                        icon: Icons.fitness_center,
                        fontSize: 18,
                        description: 'Adjustable or fixed weight pairs',
                      ),
                      SelectCard(
                        type: SelectType.equipment,
                        title: 'Resistance Bands',
                        icon: Icons.all_inclusive,
                        fontSize: 18,
                        description:
                            'Loop bands, tube bands, or pull-up assist',
                      ),
                      SelectCard(
                        type: SelectType.equipment,
                        title: 'Full Gym Equipment',
                        icon: Icons.sports_martial_arts,
                        fontSize: 18,
                        description: 'Cable machines, barbells, squat rack',
                      ),
                      ZeroBarrierCard(),
                      AdaptabilityCard(),
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
            if (cubit.state.equipment != null) {
              print(cubit.state.equipment);
            } else {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please select one option to continue.'),
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
