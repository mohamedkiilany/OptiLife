import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 121.13),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isChosen ? const Color(0xFF20C765) : const Color(0xFFF1EFF6),
            width: isChosen ? 3 : 1.5,
          ),
        ),
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
                        SizedBox(
                          width: 48,
                          child: badge != null
                              ? Container(
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
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    description,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            if (isChosen) ...[
              const SizedBox(width: 6),
              const Icon(
                Icons.check_circle,
                color: Color(0xFF20C765),
                size: 30,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
