import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/widgets/selection_style.dart';
import 'package:optilife_app/features/wizard/widgets/selection_pressable.dart';

class FitnessLevelCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String? badge;
  final bool isChosen;
  final VoidCallback onTap;

  const FitnessLevelCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.isChosen,
    required this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return SelectionPressable(
      selected: isChosen,
      onTap: onTap,
      child: AnimatedContainer(
        duration: SelectionStyle.duration,
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 121.13),
        padding: const EdgeInsets.all(16),
        decoration: SelectionStyle.card(radius: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFEAEDFF),
              ),
              child: Icon(icon, color: AppColors.primaryGreen, size: 30),
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: AppColors.darkText,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 6),
                        if (badge != null)
                          Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE2F8E9),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    badge!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Color(0xFF168542),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    description,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),
            SelectionMarker(selected: isChosen),
          ],
        ),
      ),
    );
  }
}
