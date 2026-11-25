import 'dart:async';

import 'package:flutter/material.dart';

/// Adds a quick press-in and a spring pop when an option becomes selected.
class SelectionPressable extends StatefulWidget {
  const SelectionPressable({
    super.key,
    required this.selected,
    required this.onTap,
    required this.child,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  @override
  State<SelectionPressable> createState() => _SelectionPressableState();
}

class _SelectionPressableState extends State<SelectionPressable> {
  bool _pressed = false;
  bool _popping = false;
  Timer? _popTimer;

  @override
  void didUpdateWidget(covariant SelectionPressable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.selected && widget.selected) {
      _popTimer?.cancel();
      setState(() => _popping = true);
      _popTimer = Timer(const Duration(milliseconds: 260), () {
        if (mounted) setState(() => _popping = false);
      });
    }
  }

  @override
  void dispose() {
    _popTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: widget.onTap,
    onTapDown: (_) => setState(() => _pressed = true),
    onTapUp: (_) => setState(() => _pressed = false),
    onTapCancel: () => setState(() => _pressed = false),
    child: AnimatedScale(
      scale: _pressed ? .975 : _popping ? 1.025 : 1,
      duration: Duration(milliseconds: _pressed ? 90 : 210),
      curve: _popping ? Curves.easeOutBack : Curves.easeOutCubic,
      child: widget.child,
    ),
  );
}
