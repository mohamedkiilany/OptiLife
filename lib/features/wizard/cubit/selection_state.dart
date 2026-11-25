import 'package:optilife_app/features/profile/model/user_profile.dart';

class SelectionState {
  final Set<String> environments;
  final String? equipment;
  final int? availableMinutes;
  final String? goal;
  final String? budget;
  final Set<String> dietPreferences;
  // final List<String> dislikes;
  final String? fitnessLevel;
  final String? sex;
  final int? age;
  final int? heightCm;
  final int? weightKg;
  final Set<String> ingredients;
  final String? name;
  final String? email;
  final Set<String> dislikedFoods;
  SelectionState({
    required this.environments,
    this.equipment,
    this.availableMinutes,
    this.goal,
    this.budget,
    this.dietPreferences = const {},
    // this.dislikes = const [],
    this.fitnessLevel,
    this.sex,
    this.age,
    this.heightCm,
    this.weightKg,
    this.ingredients = const {},
    this.name,
    this.email,
    this.dislikedFoods = const {},
  });

  SelectionState copyWith({
    Set<String>? environments,
    String? equipment,
    bool removeEquipment = false,
    int? availableMinutes,
    bool removeAvailableMinutes = false,
    String? goal,
    String? budget,
    Set<String>? dietPreferences,
    // List<String>? dislikes,
    String? fitnessLevel,
    String? sex,
    int? age,
    int? heightCm,
    int? weightKg,
    Set<String>? ingredients,
    String? name,
    String? email,
    Set<String>? dislikedFoods,
  }) {
    return SelectionState(
      environments: environments ?? this.environments,
      equipment: removeEquipment ? null : equipment ?? this.equipment,
      availableMinutes: removeAvailableMinutes
          ? null
          : availableMinutes ?? this.availableMinutes,
      goal: goal ?? this.goal,
      budget: budget ?? this.budget,
      dietPreferences: dietPreferences ?? this.dietPreferences,
      // dislikes: dislikes ?? this.dislikes,
      fitnessLevel: fitnessLevel ?? this.fitnessLevel,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      ingredients: ingredients ?? this.ingredients,
      name: name ?? this.name,
      email: email ?? this.email,
      dislikedFoods: dislikedFoods ?? this.dislikedFoods,
    );
  }

  
  UserProfile toProfile({required String name, required String email}) {
    return UserProfile(
      name: name,
      email: email,
      goal: goal,
      availableMinutes: availableMinutes,
      environments: environments.toList(),
      equipment: equipment,
      budget: budget,
      dietPreferences: dietPreferences.toList(),
      // dislikes == dislikedFoods.toList(),
      dislikes: dislikedFoods.toList(),
      fitnessLevel: fitnessLevel,
      sex: sex,
      age: age,
      heightCm: heightCm,
      weightKg: weightKg,
      ingredients: ingredients.toList(),
      onboardingCompleted: true,
    );
  }
}