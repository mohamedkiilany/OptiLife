import 'package:bloc/bloc.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionState(environments: {}));


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
}