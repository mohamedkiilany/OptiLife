import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class ProgressInfoTile extends StatelessWidget {
  const ProgressInfoTile({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppColors.darkText),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    ),
  );
}

class ProgressNotice extends StatelessWidget {
  const ProgressNotice({
    super.key,
    required this.background,
    required this.iconBackground,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
  });

  final Color background;
  final Color iconBackground;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(message, style: const TextStyle(fontSize: 13)),
            ],
          ),
        ),
      ],
    ),
  );
}

class ProgressConsistencyScore extends StatelessWidget {
  const ProgressConsistencyScore({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 52,
    height: 52,
    child: Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
          width: 52,
          height: 52,
          child: CircularProgressIndicator(
            value: 0.88,
            strokeWidth: 5,
            backgroundColor: AppColors.white,
            valueColor: AlwaysStoppedAnimation(AppColors.primaryGreen),
          ),
        ),
        const Text(
          '88%',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
