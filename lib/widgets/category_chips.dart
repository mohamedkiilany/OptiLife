
import 'package:flutter/material.dart';
import 'package:optilife_app/model/data.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.selected,
    required this.onChanged,
  });
 
  final IngredientCategory selected;
  final ValueChanged<IngredientCategory> onChanged;
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: IngredientCategory.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          final category = IngredientCategory.values[index];
          return _CategoryChip(
            label: category.label,
            isSelected: selected == category,
            onTap: () => onChanged(category),
          );
        },
      ),
    );
  }
}
 
class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
 
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF0F5F55) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Color(0xFF7B8794),
          ),
        ),
      ),
    );
  }
}
 