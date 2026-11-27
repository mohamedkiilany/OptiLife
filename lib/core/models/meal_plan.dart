import 'package:optilife_app/core/constants/enums.dart';
import 'package:optilife_app/core/models/meal.dart';

class MealPlan {
  final String budgetLevel;
  final int targetCalories;
  final int totalPlanCalories;
  final Meal breakfast;
  final Meal lunch;
  final Meal snack;
  final Meal dinner;

  MealPlan({
    required this.budgetLevel,
    required this.targetCalories,
    required this.totalPlanCalories,
    required this.breakfast,
    required this.lunch,
    required this.snack,
    required this.dinner,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) {
    final meals = (json['meals'] as List)
        .map((m) => Meal.fromJson(Map<String, dynamic>.from(m)))
        .toList();

    Meal findMeal(MealType type) => meals.firstWhere((m) => m.type == type);

    return MealPlan(
      budgetLevel: json['budget_level'] as String,
      targetCalories: (json['target_calories'] as num).round(),
      totalPlanCalories: (json['total_plan_calories'] as num).round(),
      breakfast: findMeal(MealType.breakfast),
      lunch: findMeal(MealType.lunch),
      snack: findMeal(MealType.snack),
      dinner: findMeal(MealType.dinner),
    );
  }
}