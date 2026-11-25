import 'package:flutter/material.dart';

class ConsistencyTip extends StatelessWidget {
  const ConsistencyTip({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(17),
      gradient: const LinearGradient(
        colors: [Color(0xFFD8F6F2), Color(0xFFEEF2FF)],
      ),
    ),
    child: const Row(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFF9CE9DD),
          child: Icon(Icons.psychology_outlined, color: Color(0xFF087C71)),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Consistency over intensity',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF182238),
                ),
              ),
              SizedBox(height: 3),
              Text(
                'A 20-minute gentle movement session preserves your streak and releases mood-lifting endorphins.',
                style: TextStyle(
                  fontSize: 11,
                  height: 1.3,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
