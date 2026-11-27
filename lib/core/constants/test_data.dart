import 'package:optilife_app/core/constants/enums.dart';
import 'package:optilife_app/core/models/meal.dart';
import 'package:optilife_app/core/models/meal_plan.dart';
import 'package:optilife_app/core/models/user_plan.dart';
import 'package:optilife_app/core/models/workout.dart';
import 'package:optilife_app/core/models/workout_plan.dart';

class TestData {
  static final UserPlan mockUserPlan = UserPlan(
  workoutPlan: WorkoutPlan(
    type: 'Low-impact conditioning circuit',
    duration: 45,
    circuitInstructions: [
      'Circuit order: Use the exercises below in order for 6 full rounds, with no extra partial round. Every visit includes 25 s work and 35 s recovery, including the final visit.',
    ],
    exercises: [
      Workout(
        name: 'Warm-up',
        met: 2.8,
        durationMinutes: 3.0,
        instructions:
            'Gentle marching, ankle movement and relaxed shoulder rolls. 180 s total. Keep an effort where short sentences remain possible; no all-out sprints.',
      ),
      Workout(
        name: 'Stationary Bike',
        met: 4.0,
        durationMinutes: 6.0,
        instructions:
            '6 rounds x (25 s controlled work + 35 s easy recovery/transition) = 6 min. Pedal at a pace where talking is comfortable.',
      ),
      Workout(
        name: 'Machine Chest Press',
        met: 3.5,
        durationMinutes: 6.0,
        instructions:
            '6 rounds x (25 s controlled work + 35 s easy recovery/transition) = 6 min. Adjust the seat and use a controlled range.',
      ),
      Workout(
        name: 'Leg Press',
        met: 3.5,
        durationMinutes: 6.0,
        instructions:
            '6 rounds x (25 s controlled work + 35 s easy recovery/transition) = 6 min. Keep the pelvis supported and avoid locking knees.',
      ),
      Workout(
        name: 'Seated Leg Curl',
        met: 3.5,
        durationMinutes: 6.0,
        instructions:
            '6 rounds x (25 s controlled work + 35 s easy recovery/transition) = 6 min. Align the knee with the machine pivot.',
      ),
      Workout(
        name: 'Seated Cable Row',
        met: 3.5,
        durationMinutes: 6.0,
        instructions:
            '6 rounds x (25 s controlled work + 35 s easy recovery/transition) = 6 min. Pull without rocking the torso.',
      ),
      Workout(
        name: 'Cable Pallof Press',
        met: 3.5,
        durationMinutes: 6.0,
        instructions:
            '6 rounds x (25 s controlled work + 35 s easy recovery/transition) = 6 min. Share the work equally between sides.',
      ),
      Workout(
        name: 'Transition',
        met: 2.8,
        durationMinutes: 1.0,
        instructions: 'Easy walking and equipment setup. 60 s total.',
      ),
      Workout(
        name: 'Cool-down',
        met: 2.3,
        durationMinutes: 5.0,
        instructions:
            'Slow walking, relaxed breathing and gentle calf and chest stretches. 300 s total.',
      ),
    ],
  ),
  mealPlan: MealPlan(
    budgetLevel: 'Medium',
    targetCalories: 2000,
    totalPlanCalories: 1996,
    breakfast: Meal(
      type: MealType.breakfast,
      name: 'Boiled Eggs with Potatoes and Tomato',
      calories: 500,
      ingredients: [
        '150g egg',
        '285g potato (raw)',
        '120g tomato',
        '5g olive oil',
      ],
      steps: [
        'Boil the eggs and the potatoes until tender.',
        'Peel and slice the potatoes and the eggs.',
        'Serve with the sliced tomato and the olive oil drizzled over.',
      ],
      prepMinutes: 10,
      protein: 25.7,
      carbs: 55.6,
      fat: 19.8,
    ),
    lunch: Meal(
      type: MealType.lunch,
      name: 'Chicken Pasta in Tomato Sauce',
      calories: 719,
      ingredients: [
        '218g chicken breast (raw)',
        '108g pasta (dry)',
        '188g tomato',
        '57g onion',
      ],
      steps: [
        'Boil the pasta until tender.',
        'Cook the chicken with the chopped tomato and onion until the sauce thickens.',
        'Toss the pasta through the sauce and serve.',
      ],
      prepMinutes: 15,
      protein: 65.4,
      carbs: 93.3,
      fat: 7.8,
    ),
    snack: Meal(
      type: MealType.snack,
      name: 'Roasted Chickpeas with Orange',
      calories: 277,
      ingredients: [
        '42g chickpeas (dry)',
        '138g orange',
        '6g sunflower oil',
      ],
      steps: [
        'Soak the chickpeas overnight.',
        'Boil until soft, then drain well.',
        'Toss in the oil and roast until crisp.',
        'Serve with the peeled orange.',
      ],
      prepMinutes: 10,
      protein: 9.9,
      carbs: 42.7,
      fat: 8.7,
    ),
    dinner: Meal(
      type: MealType.dinner,
      name: 'Lentil Soup with Baladi Bread',
      calories: 500,
      ingredients: [
        '88g lentils (dry)',
        '66g brown baladi bread',
        '96g tomato',
        '30g onion',
      ],
      steps: [
        'Rinse the lentils.',
        'Simmer with the chopped onion and tomato until soft.',
        'Blend if you like a smooth soup.',
        'Serve with the bread.',
      ],
      prepMinutes: 10,
      protein: 28.7,
      carbs: 98.5,
      fat: 1.6,
    ),
  ),
);
}