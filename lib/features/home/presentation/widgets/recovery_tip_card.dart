import 'package:flutter/material.dart';

class RecoveryTipCard extends StatelessWidget {
  final String message;

  const RecoveryTipCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEFB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFBFE9E0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.verified_outlined,
              color: Color(0xFF00695C),
              size: 18,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}