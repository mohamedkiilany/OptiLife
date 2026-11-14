import 'package:flutter/material.dart';

class ProgressOption {
  const ProgressOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.tags,
    this.badge,
    this.popular = false,
    this.recommended = false,
  });

  final String title;
  final String description;
  final IconData icon;
  final List<String> tags;
  final String? badge;
  final bool popular;
  final bool recommended;
}
