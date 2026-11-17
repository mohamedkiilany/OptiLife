import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/home/presentation/widgets/info-chips.dart';

class PlanBanner extends StatelessWidget {
  const PlanBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'assets/images/workout.png',
              fit: BoxFit.cover,
            ),

            // Dark Gradient
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 12,
              bottom: 36,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoChip(
                    text: '⏱ 20 min',
                    textColor: Colors.black,
                    backgroundColor: AppColors.bgLight,
                  ),
                  SizedBox(width: 8),
                  InfoChip(
                    text: '🔥 185 kcal',
                    textColor: Color(0xFF855300),
                    backgroundColor: AppColors.bgLight,
                  ),
                  SizedBox(width: 8),
                  InfoChip(
                    text: '3 circuits',
                    textColor: AppColors.darkGreen,
                    backgroundColor: AppColors.bgLight,
                  ),
                ],
              ),
            ),

            // Workout Title
            const Positioned(
              left: 12,
              bottom: 6,
              child: Text(
                '20-Min Core & Bodyweight Ignite',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
