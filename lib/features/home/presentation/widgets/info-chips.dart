import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class InfoChip extends StatelessWidget {
  const InfoChip({
    super.key,
    this.icon,
    this.iconColor,
    required this.text,
    required this.textColor,
    this.backgroundColor = AppColors.lightBlueBox,
  });

  final IconData? icon;
  final Color? iconColor;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: iconColor),
              const SizedBox(width: 6),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}