
import 'package:flutter/material.dart';
import 'package:optilife_app/model/data.dart';

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
        child: Text('No ingredients found', style: TextStyle(color: Color(0xFF7B8794))),
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
    final textColor = isSelected ? Colors.white : Color(0xFF1F2933);
 
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF22C55E) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isSelected
              ? null
              : const [BoxShadow(color: Color(0x0F000000), blurRadius: 6, offset: Offset(0, 2))],
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
            if (isSelected) ...[
              const SizedBox(width: 8),
              const Icon(Icons.check, size: 18, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}
 
