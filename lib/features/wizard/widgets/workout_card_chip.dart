
import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class WorkoutCardChip extends StatelessWidget {
  final Widget chipLogo;
  final String chipText;
  const WorkoutCardChip({super.key, required this.chipLogo, required this.chipText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.lightBlueBox,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [chipLogo, Text(chipText)]),
    );
  }
}