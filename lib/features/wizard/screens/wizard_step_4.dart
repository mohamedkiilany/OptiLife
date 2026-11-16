import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/presentation/widgets/progress_continue_button.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';
import 'package:optilife_app/features/wizard/widgets/adaptability_card.dart';
import 'package:optilife_app/features/wizard/widgets/select_card.dart';
import 'package:optilife_app/features/wizard/widgets/wizard_screen_chip.dart';
import 'package:optilife_app/features/wizard/widgets/zero_barrier_card.dart';

class Equipment extends StatefulWidget {
  const Equipment({super.key});

  @override
  State<Equipment> createState() => _EquipmentState();
}

class _EquipmentState extends State<Equipment> {
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
                        onTap: () => context.go(AppRouter.training),
                        child: const Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 20),
                      const Text(
                        'Step 4 Equipment',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const LinearProgressIndicator(
                  value: 4 / 8,
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
                              icon: Icons.fitness_center,
                              text: 'EQUIPMENT CHECK',
                            ),
                            const Text(
                              'Step 4 of 8',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
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
                ),
                ProgressContinueButton(
                  onPressed: () {
                    if (cubit.state.equipment==null) {
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
                    context.go(AppRouter.budget);
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
