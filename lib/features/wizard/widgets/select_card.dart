import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/widgets/workout_card_chip.dart';

enum SelectType {environments,equipment}

class SelectCard extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;
  final SelectType type;
  final WorkoutCardChip? firstChip;
  final WorkoutCardChip? secondChip;
  final bool boldFont;
  final double fontSize;
  final IconData? icon;

  const SelectCard({
    super.key,
    required this.title,
    required this.description,
    required this.type,
    this.firstChip,
    this.secondChip,
    this.boldFont = true,
    this.fontSize = 24,
    this.imagePath,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    
        SelectionCubit cubit = context.read<SelectionCubit>();
        bool isSelected = (cubit.state.environments.contains(title) || cubit.state.equipment == title);
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin:EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : AppColors.unSelectedCard,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isSelected ? 0.2 : 0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
                if (type == SelectType.environments) {
                  cubit.selectEnvironments(title);
                } else {
                  cubit.selectEquipment(title);
                }
            },
            child: Row(
              children: [
                if (imagePath != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      imagePath!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (icon != null && imagePath == null)
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? AppColors.selectedCardIcon : AppColors.lightBlueBox,
                    ),
                    child: Icon(icon, size: 40),
                  ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: TextStyle(
                                fontSize: fontSize,
                                fontWeight: boldFont
                                    ? FontWeight.bold
                                    : null,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: isSelected
                                ? AppColors.lightGreen
                                : AppColors.lightBlueBox,
                            child: isSelected
                                ? Icon(Icons.check, color: Colors.white)
                                : null,
                          ),
                        ],
                      ),
                      Text(description),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ?firstChip ,
                          if (secondChip != null) SizedBox(width: 20),
                          ?secondChip
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
