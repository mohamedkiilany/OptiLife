import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/home/presentation/widgets/info_chips.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';

class TodaysConstraintsCard extends StatelessWidget {
  const TodaysConstraintsCard({super.key});

  @override
  Widget build(BuildContext context) {
    const neutralBg = Color(0xFFEDEBFA);
    const neutralFg = Color(0xFF1F2937);
    const greenBg = Color(0xFFE3F4EE);

    final Map<String, Map<String, dynamic>> envLabels = {
      'Home / Apartment': {'emoji': '🏠', 'label': 'At Home'},
      'Commercial Gym': {'emoji': '🏋️', 'label': 'Gym'},
      'Outdoors & Parks': {'emoji': '🌳', 'label': 'Outdoors'},
    };

    final Map<String, Map<String, dynamic>> equipmentLabels = {
      'None (Bodyweight Only)': {'emoji': '🙌', 'label': 'No equipment'},
      'Dumbbells / Kettlebells': {'emoji': '🏋️', 'label': 'Dumbbells'},
      'Resistance Bands': {'emoji': '➰', 'label': 'Bands'},
      'Full Gym Equipment': {'emoji': '🏢', 'label': 'Full gym'},
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.screenchipBg,
                radius: 14,
                child: Icon(Icons.tune, color: AppColors.darkGreen, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                "Today's Constraints",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.go(AppRouter.availableTime);
                },
                child: const InfoChip(
                  icon: Icons.edit,
                  iconColor: AppColors.darkGreen,
                  text: 'Edit',
                  textColor: AppColors.darkGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(
                Icons.check_circle_outline,
                color: AppColors.darkGreen,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'All recommendations calibrated to your limits',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 8),
          BlocBuilder<SelectionCubit, SelectionState>(
            builder: (context, state) {
              final List<Map<String, dynamic>> items = [
                if (state.availableMinutes != null)
                  {
                    'emoji': '⏱',
                    'label': '${state.availableMinutes} min max',
                    'background': neutralBg,
                    'foreground': neutralFg,
                  },
                ...state.environments.map((e) {
                  final data = envLabels[e];
                  return {
                    'emoji': data?['emoji'] ?? '📍',
                    'label': data?['label'] ?? e,
                    'background': greenBg,
                    'foreground': AppColors.darkGreen,
                  };
                }),
                // if (state.budget != null)
                //   {
                //     'emoji': '💰',
                //     'label': '\$${state.budget!.toStringAsFixed(2)} budget',
                //     'background': budgetBg,
                //     'foreground': budgetFg,
                //   },
                if (state.equipment != null)
                  {
                    'emoji': equipmentLabels[state.equipment]?['emoji'] ?? '🧰',
                    'label':
                        equipmentLabels[state.equipment]?['label'] ??
                        state.equipment!,
                    'background': neutralBg,
                    'foreground': neutralFg,
                  },
              ];

              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: items.map((item) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: item['background'],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item['emoji'],
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          item['label'],
                          style: TextStyle(
                            color: item['foreground'],
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
