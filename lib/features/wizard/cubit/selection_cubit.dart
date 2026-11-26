import 'package:bloc/bloc.dart';
import 'package:optilife_app/features/profile/model/user_profile.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit()
    : super(
        SelectionState(
          environments: {},
          age: 28,
          heightCm: 178,
          weightKg: 76,
        ),
      );


  void setAccount({required String name, required String email}) => emit(
        state.copyWith(name: name.trim(), email: email.trim()),
      );

  void setEnvironments(Set<String> environments) => emit(
        state.copyWith(environments: Set.unmodifiable(environments)),
      );

  void setEquipment(String equipment) =>
      emit(state.copyWith(equipment: equipment));

  void setDislikedFoods(Set<String> foods) => emit(
        state.copyWith(dislikedFoods: Set.unmodifiable(foods)),
      );


  void selectEquipment(String selection) {
    if (state.equipment == selection) {
      emit(state.copyWith(removeEquipment: true));
    } else {
      emit(state.copyWith(equipment: selection));
    }
  }

  void selectEnvironments(String selection) {
    final Set<String> newSet = {...state.environments};
    if (newSet.contains(selection)) {
      newSet.remove(selection);
    } else {
      newSet.add(selection);
    }
    emit(state.copyWith(environments: newSet));
  }

  void skipEquipment() {
    emit(state.copyWith(removeEquipment: true));
  }

  void skipEnvironments() {
    emit(state.copyWith(environments: {}));
  }

  void setAvailableMinutes(int minutes) {
    emit(state.copyWith(availableMinutes: minutes));
  }

  void skipAvailableMinutes() {
    emit(state.copyWith(removeAvailableMinutes: true));
  }

  // void skipBudget() {
  //   emit(state.copyWith(removeBudget: true));
  // }

  void setGoal(String goal) => emit(state.copyWith(goal: goal));

  void setBudget(String budget) => emit(state.copyWith(budget: budget));

  void setDietPreferences(Set<String> preferences) =>
      emit(state.copyWith(dietPreferences: {...preferences}));

  void setDislikes(List<String> dislikes) =>
      emit(state.copyWith(dislikedFoods: Set.unmodifiable(dislikes)));

  void setFitnessLevel(String level) =>
      emit(state.copyWith(fitnessLevel: level));

  void setBodyMetrics({String? sex, int? age, int? heightCm, int? weightKg}) {
    emit(state.copyWith(
      sex: sex,
      age: age,
      heightCm: heightCm,
      weightKg: weightKg,
    ));
  }

  void setIngredients(Set<String> ingredients) =>
      emit(state.copyWith(ingredients: {...ingredients}));

  void loadFromProfile(UserProfile p) {
    emit(SelectionState(
      name: p.name,
      email: p.email,
      environments: p.environments.toSet(),
      equipment: p.equipment,
      availableMinutes: p.availableMinutes,
      goal: p.goal,
      budget: p.budget,
      dietPreferences: p.dietPreferences.toSet(),
      dislikedFoods: p.dislikes.toSet(),
      fitnessLevel: p.fitnessLevel,
      sex: p.sex,
      age: p.age,
      heightCm: p.heightCm,
      weightKg: p.weightKg,
      ingredients: p.ingredients.toSet(),
    ));
  }

  void reset() => emit(
    SelectionState(
      environments: {},
      age: 28,
      heightCm: 178,
      weightKg: 76,
    ),
  );
}
