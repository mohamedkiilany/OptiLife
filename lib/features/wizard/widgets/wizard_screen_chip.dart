import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class WizardScreenChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const WizardScreenChip({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.screenchipBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.screenChipText),
          Text(
            text,
            style: TextStyle(color: AppColors.screenChipText),
          ),
        ],
      ),
    );
  }
}
