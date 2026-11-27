import 'package:flutter/material.dart';

class WorkoutConsistencyCard extends StatelessWidget {
  final int totalDays;
  final int activeDays;
  const WorkoutConsistencyCard({
    super.key,
    required this.totalDays,
    required this.activeDays,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Workout\nConsistency',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color(0xFFD1FAE5),
                  child: const Icon(
                    Icons.done_all,
                    size: 18,
                    color: Color(0xFF065F46),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${((activeDays / totalDays) * 100).round()} %',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$activeDays / $totalDays days\nactive',
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  width: 56,
                  height: 56,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: activeDays / totalDays,
                        strokeWidth: 5,
                        backgroundColor: Colors.grey.shade200,
                        color: const Color(0xFF16A34A),
                        strokeCap: StrokeCap.round,
                      ),
                      Text(
                        '${activeDays}d',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF065F46),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
