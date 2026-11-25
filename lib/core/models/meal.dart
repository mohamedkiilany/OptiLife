import 'package:optilife_app/core/constants/enums.dart';

class Meal {
  final MealType type;
  final String name;
  final int calories;
  List<String> ingredients;
  final String preparation;

  Meal({
    required this.type,
    required this.name,
    required this.calories,
    required this.ingredients,
    required this.preparation,
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
      preparation: json['preparation'] as String,
    );
  }
}
