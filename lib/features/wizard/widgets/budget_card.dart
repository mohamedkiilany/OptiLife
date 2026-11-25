import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/widgets/selection_style.dart';
import 'package:optilife_app/features/wizard/widgets/selection_pressable.dart';

class BudgetCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String weeklyBudget;
  final String mealBudget;
  final String description;
  final List<String> tags;
  final bool isSelected;
  final VoidCallback onTap;

  const BudgetCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.weeklyBudget,
    required this.mealBudget,
    required this.description,
    required this.tags,
    required this.isSelected,
    required this.onTap,
  });

  static const _textColor = Color(0xFF0F172A);
  static const _chipColor = Color(0xFFE8EAFF);

  @override
  Widget build(BuildContext context) {
    return SelectionPressable(
      selected: isSelected,
      onTap: onTap,
      child: AnimatedContainer(
          duration: SelectionStyle.duration,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: SelectionStyle.card(radius: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.badge,
                      borderRadius: BorderRadiusGeometry.all(Radius.circular(10))
                    ),
                    child: Icon(Icons.attach_money,size: 30,),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(color: AppColors.darkText,fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(color: AppColors.primaryTeal,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(width: 8),
                  SelectionMarker(selected: isSelected),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Text(
                    weeklyBudget,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: _textColor,
                    ),
                  ),
                  const Text('/ week', style: TextStyle(color: AppColors.muted,fontWeight: FontWeight.bold)),
                  _BudgetChip(text: mealBudget, background: _chipColor),
                ],
              ),
              const SizedBox(height: 12),
              Text(description, style: const TextStyle(color: AppColors.muted,fontWeight: FontWeight.bold)),
              if (tags.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags
                      .map((tag) => _BudgetChip(text: tag, background: _chipColor))
                      .toList(),
                ),
              ],
            ],
          ),
      ),
    );
  }
}

class _BudgetChip extends StatelessWidget {
  final String text;
  final Color background;

  const _BudgetChip({required this.text, required this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(color: AppColors.primaryTeal,fontWeight: FontWeight.bold)),
    );
  }
}
