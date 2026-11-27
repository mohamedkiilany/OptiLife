import 'package:flutter/material.dart';

class ActiveStreakCard extends StatelessWidget {
  final int streakCount;
  final bool isBest;
  const new({super.key, required this.streakCount, required this.isBest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Active Streak', style: TextStyle(fontSize: 14)),
                Text('🔥'),
              ],
            ),
            Text(
              '$streakCount Days',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            if (isBest)
              Text(
                'Personal best streak!',
                style: TextStyle(color: Color(0xFF946820)),
              ),
          ],
        ),
      ),
    );
  }
}
