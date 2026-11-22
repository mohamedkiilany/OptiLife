class SelectionState {
  final Set<String> environments;
  final String? equipment;
  final int? availableMinutes;
  // final String? budget;
  SelectionState({
    required this.environments,
    this.equipment,
    this.availableMinutes,
    // this.budget,
  });

  SelectionState copyWith({
    Set<String>? environments,
    String? equipment,
    bool removeEquipment = false,
    int? availableMinutes,
    bool removeAvailableMinutes = false,
    // String? budget,
    // bool removeBudget = false,
  }) {
    return SelectionState(
      environments: environments ?? this.environments,
      equipment: removeEquipment ? null : equipment ?? this.equipment,
      availableMinutes: removeAvailableMinutes
          ? null
          : availableMinutes ?? this.availableMinutes,
      // budget: removeBudget ? null : budget ?? this.budget,
    );
  }
}
