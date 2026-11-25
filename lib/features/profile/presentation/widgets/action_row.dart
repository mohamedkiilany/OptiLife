import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: CircleAvatar(
      backgroundColor: AppColors.background,
      child: Icon(icon, color: AppColors.navy),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: AppColors.darkText,
        fontWeight: FontWeight.w700,
      ),
    ),
    subtitle: Text(subtitle, style: const TextStyle(color: AppColors.muted)),
    trailing: const Icon(Icons.chevron_right, color: Colors.black),
  );
}
