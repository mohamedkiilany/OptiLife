import 'package:flutter/material.dart';

class OnboardingProgress extends StatelessWidget {
  final double value; 

  const OnboardingProgress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: const Color(0xFFE2E7FF),
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF22C55E)),
          minHeight: 6,
        ),
      ),
    );
  }
}