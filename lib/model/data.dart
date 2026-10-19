enum IngredientCategory {
  all('All'),
  proteins('Proteins'),
  carbs('Carbs & Grains'),
  vegetables('Vegetables');

  const IngredientCategory(this.label);
  final String label;
}

class Ingredient {
  const Ingredient({
    required this.emoji,
    required this.name,
    required this.category,
    required this.weeklySaving,
  });

  final String emoji;
  final String name;
  final IngredientCategory category;
  final int weeklySaving; // in dollars
}

const ingredients = <Ingredient>[
  // Proteins
  Ingredient(
    emoji: '🥚',
    name: 'Eggs',
    category: IngredientCategory.proteins,
    weeklySaving: 5,
  ),
  Ingredient(
    emoji: '🍗',
    name: 'Canned Tuna / Chicken',
    category: IngredientCategory.proteins,
    weeklySaving: 4,
  ),
  Ingredient(
    emoji: '🫘',
    name: 'Canned Chickpeas / Beans',
    category: IngredientCategory.proteins,
    weeklySaving: 3,
  ),
  Ingredient(
    emoji: '🥛',
    name: 'Greek Yogurt / Milk',
    category: IngredientCategory.proteins,
    weeklySaving: 4,
  ),
  Ingredient(
    emoji: '🥜',
    name: 'Peanut Butter',
    category: IngredientCategory.proteins,
    weeklySaving: 3,
  ),
  // Carbs & Grains
  Ingredient(
    emoji: '🍚',
    name: 'Rice',
    category: IngredientCategory.carbs,
    weeklySaving: 5,
  ),
  Ingredient(
    emoji: '🥣',
    name: 'Oats',
    category: IngredientCategory.carbs,
    weeklySaving: 4,
  ),
  Ingredient(
    emoji: '🍝',
    name: 'Pasta',
    category: IngredientCategory.carbs,
    weeklySaving: 3,
  ),
  // Vegetables
  Ingredient(
    emoji: '🧅',
    name: 'Onions',
    category: IngredientCategory.vegetables,
    weeklySaving: 3,
  ),
  Ingredient(
    emoji: '🥦',
    name: 'Frozen Veggies',
    category: IngredientCategory.vegetables,
    weeklySaving: 6,
  ),
  Ingredient(
    emoji: '🥔',
    name: 'Potatoes',
    category: IngredientCategory.vegetables,
    weeklySaving: 4,
  ),
  Ingredient(
    emoji: '🥕',
    name: 'Carrots',
    category: IngredientCategory.vegetables,
    weeklySaving: 2,
  ),
];

const initiallySelected = <String>{
  'Eggs',
  'Canned Tuna / Chicken',
  'Canned Chickpeas / Beans',
  'Rice',
  'Oats',
  'Onions',
  'Frozen Veggies',
  'Potatoes',
};
