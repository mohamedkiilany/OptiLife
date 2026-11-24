import 'package:optilife_app/core/models/meal_plan.dart';
import 'package:optilife_app/core/models/workout_plan.dart';

class UserPlan {
  final WorkoutPlan workoutPlan;
  final MealPlan mealPlan;

  UserPlan({
    required this.workoutPlan,
    required this.mealPlan,
  });

  factory UserPlan.fromJson(Map<String, dynamic> json) {
    return UserPlan(
      workoutPlan: WorkoutPlan.fromJson(
        Map<String, dynamic>.from(json['workout_plan']),
      ),
      mealPlan: MealPlan.fromJson(
        Map<String, dynamic>.from(json['meal_plan']),
      ),
    );
  }
}