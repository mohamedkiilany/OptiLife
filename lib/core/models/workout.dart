class Workout {
  final String name;
  final double met;
  final double durationMinutes;
  final String instructions;

  Workout({
    required this.name,
    required this.met,
    required this.durationMinutes,
    required this.instructions,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      name: json['name'] as String,
      met: (json['met'] as num).toDouble(),
      durationMinutes: (json['duration_minutes'] as num).toDouble(),
      instructions: json['instructions'] as String,
    );
  }
}