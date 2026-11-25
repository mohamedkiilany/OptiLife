class WorkoutPlan {
  final String type;
  final int duration;
  final List<String> exercises;

  WorkoutPlan({
    required this.type,
    required this.duration,
    required this.exercises,
  });


  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      type: json['type'] as String,
      duration: (json['duration_minutes'] as num).toInt(),
      exercises: List<String>.from(json['exercises']),
    );
  }
}
