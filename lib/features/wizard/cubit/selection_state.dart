class SelectionState {
  final Set<String> environments;
  final String? equipment;
  SelectionState({required this.environments, this.equipment});

  SelectionState copyWith({Set<String>? environments, String? equipment ,bool removeEquipment = false}) {
    return SelectionState(
      environments: environments ?? this.environments,
      equipment: removeEquipment ? null : equipment ?? this.equipment,
    );
  }
}
