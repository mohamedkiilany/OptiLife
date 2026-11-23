import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

/// Starter page for the workout preview flow. Expand this page with workout
/// details and controls as the preview experience is designed.
class WorkoutPreviewScreen extends StatelessWidget {
  const WorkoutPreviewScreen({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    this.image,
  });

  final String title;
  final String description;
  final String duration;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Workout Preview'),
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                image!,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox(
                  height: 220,
                  child: Center(child: Icon(Icons.fitness_center, size: 48)),
                ),
              ),
            ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(duration, style: const TextStyle(color: AppColors.darkGreen)),
          const SizedBox(height: 12),
          Text(description, style: const TextStyle(height: 1.4)),
        ],
      ),
    );
  }
}
