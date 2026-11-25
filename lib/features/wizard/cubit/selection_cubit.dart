import 'package:bloc/bloc.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionState(environments: {}));

  void setAccount({required String name, required String email}) => emit(
    state.copyWith(name: name.trim(), email: email.trim()),
  );
  void setEnvironments(Set<String> environments) => emit(
    state.copyWith(environments: Set.unmodifiable(environments)),
  );
  void setEquipment(String equipment) => emit(state.copyWith(equipment: equipment));
  void setGoal(String goal) => emit(state.copyWith(goal: goal));
  void setBudget(String budget) => emit(state.copyWith(budget: budget));
  void setDietPreferences(Set<String> preferences) => emit(
    state.copyWith(dietPreferences: Set.unmodifiable(preferences)),
  );
  void setDislikedFoods(Set<String> foods) => emit(
    state.copyWith(dislikedFoods: Set.unmodifiable(foods)),
  );
  void setFitnessLevel(String level) => emit(state.copyWith(fitnessLevel: level));


  void selectEquipment(String selection){
    if(state.equipment == selection){
      emit(state.copyWith(removeEquipment: true));
    }else{
      emit(state.copyWith(equipment: selection));
    }
    

  }

  void selectEnvironments(String selection){
    final Set<String> newSet = {...state.environments};
    if(newSet.contains(selection)){
      newSet.remove(selection);
    }else{
      newSet.add(selection);
    }
    emit(state.copyWith(environments: newSet));
  }

  void skipEquipment(){
    emit(state.copyWith(removeEquipment: true));
  }

  void skipEnvironments(){
    emit(state.copyWith(environments: {}));
  }
    void setAvailableMinutes(int minutes) {
    emit(state.copyWith(availableMinutes: minutes));
  }

  // void setBudget(String budget) {
  //   emit(state.copyWith(budget: budget));
  // }

  void skipAvailableMinutes() {
    emit(state.copyWith(removeAvailableMinutes: true));
  }

  // void skipBudget() {
  //   emit(state.copyWith(removeBudget: true));
  // }
}
