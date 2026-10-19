import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:optilife_app/model/data.dart';

class SelectionState {
  const SelectionState({
    required this.selected,
    this.category = IngredientCategory.proteins,
  });

  final Set<String> selected;
  final IngredientCategory category;
  int calculateSavings() {
    int total = 0;
    for (final item in ingredients) {
      if (selected.contains(item.name)) {
        total += item.weeklySaving;
      }
    }
    return total;
  }

  SelectionState copyWith({
    Set<String>? selected,
    IngredientCategory? category,
  }) {
    return SelectionState(
      selected: selected ?? this.selected,
      category: category ?? this.category,
    );
  }
}

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(const SelectionState(selected: initiallySelected));

  void selectCategory(IngredientCategory category) {
    emit(state.copyWith(category: category));
  }

  void toggle(Ingredient ingredient) {
    final updated = {...state.selected};
    if (!updated.remove(ingredient.name)) {
      updated.add(ingredient.name);
    }
    emit(state.copyWith(selected: updated));
  }
}

// Combines the search text and the category into the list shown on screen.
List<Ingredient> filterIngredients({
  required IngredientCategory category,
  required String query,
}) {
  return ingredients.where((i) {
    final matchesCategory =
        category == IngredientCategory.all || i.category == category;
    final matchesQuery = i.name.toLowerCase().contains(query.toLowerCase());
    return matchesCategory && matchesQuery;
  }).toList();
}