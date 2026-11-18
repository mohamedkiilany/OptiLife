
import 'package:flutter/material.dart';

class SelectionSummary extends StatelessWidget {
  const SelectionSummary({
    super.key,
    required this.count,
    required this.estimatedSavings,
  });
 
  final int count;
  final int estimatedSavings;
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xFF6EF08A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle_outline, size: 16, color: Color(0xFF0F5F55)),
              const SizedBox(width: 6),
              Text(
                '$count staple ingredients selected',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F5F55),
                ),
              ),
            ],
          ),
        ),
        Text(
          'Est. saved: ~\$$estimatedSavings/wk',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F5F55),
          ),
        ),
      ],
    );
  }
}
 