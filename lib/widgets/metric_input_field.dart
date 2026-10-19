import 'package:flutter/material.dart';

class MetricInputField extends StatelessWidget {
  final String label;
  final String unit;
  final String initialValue;

  const MetricInputField({
    super.key,
    required this.label,
    required this.unit,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF3D4A3D),  
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              unit,
              style: const TextStyle(
                color: Color(0xFF8B948B), 
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F6FF), 
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: TextFormField(
              initialValue: initialValue,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Color(0xFF131B2E),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


