class FridgeRecipe {
  final String name;
  final int calories;
  final double protein;
  final double carbs;
  final double fat;
  final int prepMinutes;
  final double estimatedCost;
  final List<String> missingIngredients;
  final String preparation;

  FridgeRecipe({
    required this.name,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.prepMinutes,
    required this.estimatedCost,
    required this.missingIngredients,
    required this.preparation,
  });

  factory FridgeRecipe.fromJson(Map<String, dynamic> json) {
    return FridgeRecipe(
      name: json['name'] as String,
      calories: (json['calories'] as num?)?.round() ?? 0,
      protein: (json['protein_g'] as num?)?.toDouble() ?? 0,
      carbs: (json['carbs_g'] as num?)?.toDouble() ?? 0,
      fat: (json['fat_g'] as num?)?.toDouble() ?? 0,
      prepMinutes: (json['prep_minutes'] as num?)?.round() ?? 0,
      estimatedCost: (json['estimated_cost'] as num?)?.toDouble() ?? 0,
      missingIngredients: List<String>.from(json['missing_ingredients'] ?? []),
      preparation: json['preparation'] as String? ?? '',
    );
  }
}

class FridgeScanResult {
  final List<String> ingredients;
  final List<FridgeRecipe> recipes;

  FridgeScanResult({required this.ingredients, required this.recipes});

  factory FridgeScanResult.fromJson(Map<String, dynamic> json) {
    return FridgeScanResult(
      ingredients: List<String>.from(json['ingredients'] ?? []),
      recipes: (json['recipes'] as List? ?? [])
          .map((e) => FridgeRecipe.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}