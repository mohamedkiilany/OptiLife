import 'package:optilife_app/core/constants/enums.dart';
import 'package:optilife_app/core/services/meal.dart';

class MealPlan {
  final Meal breakfast;
  final Meal lunch;
  final Meal snack;
  final Meal dinner;

  MealPlan({
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
      breakfast: findMeal(MealType.breakfast),
      lunch: findMeal(MealType.lunch),
      snack: findMeal(MealType.snack),
      dinner: findMeal(MealType.dinner),
    );
  }
}
