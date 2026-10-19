import 'package:flutter/material.dart';

class NoStressCard extends StatelessWidget {
  const NoStressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ScanIcon(),
          SizedBox(width: 14),
          Expanded(child: _NoStressText()),
        ],
      ),
    );
  }
}
class _ScanIcon extends StatelessWidget {
  const _ScanIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Color(0xFF9AF0E2),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.document_scanner_outlined,
        size: 24,
        color: Color(0xFF0F5F55),
      ),
    );
  }
}
class _NoStressText extends StatelessWidget {
  const _NoStressText();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'No stress about missing items',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF192238),
          ),
        ),
        SizedBox(height: 4),
        Text.rich(
          TextSpan(
            text: "Don't worry, you can scan your fridge or add more items anytime in ",
            children: [
              TextSpan(
                text: '“What Can I Make?”',
                style: TextStyle(
                  color: Color(0xFF0F6B5C),
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(text: '.'),
            ],
          ),
          style: TextStyle(
            fontSize: 14,
            height: 1.35,
            color: Color(0xFF3D4A3D),
          ),
        ),
      ],
    );
  }
}