import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/progress/models/progress_option.dart';
import 'package:optilife_app/features/wizard/widgets/selection_style.dart';
import 'package:optilife_app/features/wizard/widgets/selection_pressable.dart';

class TimeOptionCard extends StatelessWidget {
  const TimeOptionCard({super.key, required this.option, required this.selected, required this.onTap});

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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (option.recommended) ...[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(color: const Color(0xFFCCF5EC), borderRadius: BorderRadius.circular(10)),
                  child: const Text('✨ Recommended for you', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primaryTeal)),
                ),
                const Text('TOP MATCH', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF166534))),
              ]),
              const SizedBox(height: 12),
            ],
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: AppColors.badge, borderRadius: BorderRadius.circular(16)),
                child: Icon(option.icon, color: AppColors.darkGreen),
              ),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Flexible(child: Text(option.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.darkText))),
                  if (option.badge != null) ...[
                    const SizedBox(width: 7),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: AppColors.badge, borderRadius: BorderRadius.circular(10)),
                      child: Text(option.badge!, style: const TextStyle(fontSize: 12)),
                    ),
                  ],
                ]),
                const SizedBox(height: 6),
                Text(option.description, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
              ])),
              const SizedBox(width: 8),
              SelectionMarker(selected: selected),
            ]),
            const SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 6, children: [
              for (final tag in option.tags)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.badge, borderRadius: BorderRadius.circular(12)),
                  child: Text(tag, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.darkText)),
                ),
            ]),
          ]),
        ),
      );
}
