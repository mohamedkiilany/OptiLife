import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

abstract final class SelectionStyle {
  static const duration = Duration(milliseconds: 200);

  static BoxDecoration card({double radius = 20}) =>
      BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AppColors.badge,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      );
}

class SelectionMarker extends StatelessWidget {
  const SelectionMarker({super.key, required this.selected});

  static const double size = 28;
  final bool selected;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: SelectionStyle.duration,
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: selected ? AppColors.darkGreen : AppColors.white,
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.badge, width: selected ? 0 : 1),
    ),
    child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 160),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: FadeTransition(opacity: animation, child: child),
      ),
      child: selected
          ? const Icon(
              Icons.check,
              key: ValueKey('selected'),
              color: AppColors.white,
              size: 18,
            )
          : const SizedBox(key: ValueKey('unselected')),
    ),
  );
}
