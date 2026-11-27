import 'package:optilife_app/core/models/workout.dart';

class WorkoutPlan {
  final String type;
  final int duration;
  final List<String> circuitInstructions;
  final List<Workout> exercises;

  WorkoutPlan({
    required this.type,
    required this.duration,
    this.circuitInstructions = const [],
    required this.exercises,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      type: json['type'] as String,
      duration: (json['duration_minutes'] as num).toInt(),
      circuitInstructions: json['circuit_instructions'] != null
          ? List<String>.from(json['circuit_instructions'])
          : const [],
      exercises: (json['exercises'] as List)
          .map((e) => Workout.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}