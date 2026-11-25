import 'package:flutter/material.dart';
import 'package:optilife_app/features/final_wizard/model/data.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/widgets/selection_style.dart';
import 'package:optilife_app/features/wizard/widgets/selection_pressable.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({
    super.key,
    required this.ingredients,
    required this.selected,
    required this.onToggle,
  });

  final List<Ingredient> ingredients;
  final Set<String> selected;
  final ValueChanged<Ingredient> onToggle;

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return const Center(
        child: Text(
          'No ingredients found',
          style: TextStyle(color: Color(0xFF7B8794)),
        ),
      );
    }

    // This widget is placed inside the page's SingleChildScrollView. A
    // ListView there gets unbounded height, so let the outer scroll view
    // handle scrolling and size this list to its contents.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < ingredients.length; index++) ...[
          if (index > 0) const SizedBox(height: 10),
          IngredientChip(
            ingredient: ingredients[index],
            isSelected: selected.contains(ingredients[index].name),
            onTap: () => onToggle(ingredients[index]),
          ),
        ],
      ],
    );
  }
}

class IngredientChip extends StatelessWidget {
  const IngredientChip({
    super.key,
    required this.ingredient,
    required this.isSelected,
    required this.onTap,
  });

  final Ingredient ingredient;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const textColor = AppColors.darkText;

    return SelectionPressable(
      selected: isSelected,
      onTap: onTap,
      child: AnimatedContainer(
        duration: SelectionStyle.duration,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColors.badge,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(ingredient.emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Text(
              ingredient.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(width: 8),
            SelectionMarker(selected: isSelected),
          ],
        ),
      ),
    );
  }
}
