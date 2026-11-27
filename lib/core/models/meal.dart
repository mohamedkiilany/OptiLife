import 'package:optilife_app/core/constants/enums.dart';

class Meal {
  final MealType type;
  final String name;
  final int calories;
  final List<String> ingredients;
  final List<String> steps;
  final int prepMinutes;
  final double protein;
  final double carbs;
  final double fat;

  Meal({
    required this.type,
    required this.name,
    required this.calories,
    required this.ingredients,
    required this.steps,
    required this.prepMinutes,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    final typeStr = (json['meal_type'] as String).toLowerCase();
    final mealType = MealType.values.firstWhere(
      (e) => e.name.toLowerCase() == typeStr,
    );

    return Meal(
      type: mealType,
      name: json['name'] as String,
      calories: (json['calories'] as num).round(),
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      prepMinutes: (json['prep_minutes'] as num).toInt(),
      protein: (json['protein_g'] as num).toDouble(),
      carbs: (json['carbs_g'] as num).toDouble(),
      fat: (json['fat_g'] as num).toDouble(),
    );
  }
}