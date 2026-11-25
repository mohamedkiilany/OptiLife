
import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class ProfileItem {
  const ProfileItem(this.icon, this.label, this.value);
  final IconData icon;
  final String label;
  final String value;
}

class ConstraintRow extends StatelessWidget {
  const ConstraintRow({super.key,required this.item});
  final ProfileItem item;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 9),
    child: Row(
      children: [
        CircleAvatar(
          radius: 19,
          backgroundColor: const Color(0xFFF0F2FF),
          child: Icon(item.icon, size: 19, color: AppColors.darkGreen),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: const TextStyle(
                  color: AppColors.navy,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  letterSpacing: .4,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                item.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.muted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        // const Icon(Icons.chevron_right, color: Colors.black),
      ],
    ),
  );
}

