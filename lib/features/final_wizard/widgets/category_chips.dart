import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/final_wizard/model/data.dart';
import 'package:optilife_app/features/wizard/widgets/selection_style.dart';
import 'package:optilife_app/features/wizard/widgets/selection_pressable.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final IngredientCategory? selected;
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
    return SelectionPressable(
      selected: isSelected,
      onTap: onTap,
      child: AnimatedContainer(
        duration: SelectionStyle.duration,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.badge,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.muted)),
            const SizedBox(width: 6),
            SelectionMarker(selected: isSelected),
          ],
        ),
      ),
    );
  }
}
