class SelectionState {
  final Set<String> environments;
  final String? equipment;
  final int? availableMinutes;
  final String? name;
  final String? email;
  final String? goal;
  final String? budget;
  final Set<String> dietPreferences;
  final Set<String> dislikedFoods;
  final String? fitnessLevel;
  SelectionState({
    required this.environments,
    this.equipment,
    this.availableMinutes,
    this.name,
    this.email,
    this.goal,
    this.budget,
    this.dietPreferences = const {},
    this.dislikedFoods = const {},
    this.fitnessLevel,
  });

  SelectionState copyWith({
    Set<String>? environments,
    String? equipment,
    bool removeEquipment = false,
    int? availableMinutes,
    bool removeAvailableMinutes = false,
    String? name,
    String? email,
    String? goal,
    String? budget,
    Set<String>? dietPreferences,
    Set<String>? dislikedFoods,
    String? fitnessLevel,
  }) {
    return SelectionState(
      environments: environments ?? this.environments,
      equipment: removeEquipment ? null : equipment ?? this.equipment,
      availableMinutes: removeAvailableMinutes
          ? null
          : availableMinutes ?? this.availableMinutes,
      name: name ?? this.name,
      email: email ?? this.email,
      goal: goal ?? this.goal,
      budget: budget ?? this.budget,
      dietPreferences: dietPreferences ?? this.dietPreferences,
      dislikedFoods: dislikedFoods ?? this.dislikedFoods,
      fitnessLevel: fitnessLevel ?? this.fitnessLevel,
    );
  }
}
