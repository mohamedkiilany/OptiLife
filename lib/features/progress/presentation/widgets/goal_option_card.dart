import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/models/progress_option.dart';
import 'package:optilife_app/features/wizard/widgets/selection_style.dart';
import 'package:optilife_app/features/wizard/widgets/selection_pressable.dart';

class GoalOptionCard extends StatelessWidget {
  const GoalOptionCard({
    super.key,
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final ProgressOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => SelectionPressable(
    selected: selected,
    onTap: onTap,
    child: AnimatedContainer(
      duration: SelectionStyle.duration,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: SelectionStyle.card(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OptionIcon(option: option),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        option.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColors.muted,
                        ),
                      ),
                    ),
                    if (option.popular) ...[
                      const SizedBox(width: 6),
                      const _Tag(
                        text: 'Popular',
                        background: Color(0xFFF3E8B5),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  option.description,
                  style: const TextStyle(fontSize: 13, color: AppColors.muted),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    for (final tag in option.tags)
                      _Tag(
                        text: tag,
                        background: const Color(0xFFE0E4FF),
                        foreground: AppColors.primaryTeal,
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          _SelectionMark(selected: selected),
        ],
      ),
    ),
  );
}

class _OptionIcon extends StatelessWidget {
  const _OptionIcon({required this.option});
  final ProgressOption option;

  @override
  Widget build(BuildContext context) => Container(
    width: 56,
    height: 56,
    decoration: BoxDecoration(
      color: AppColors.badge,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(option.icon, color: AppColors.muted),
  );
}

class _Tag extends StatelessWidget {
  const _Tag({
    required this.text,
    required this.background,
    this.foreground = AppColors.primaryTeal,
  });
  final String text;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: foreground,
      ),
    ),
  );
}

class _SelectionMark extends StatelessWidget {
  const _SelectionMark({required this.selected});
  final bool selected;

  @override
  Widget build(BuildContext context) => SelectionMarker(selected: selected);
}
