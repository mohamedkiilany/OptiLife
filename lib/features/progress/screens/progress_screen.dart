import 'package:flutter/material.dart';
import 'package:optilife_app/features/progress/widgets/active_streak_card.dart';
import 'package:optilife_app/features/progress/widgets/activity_heatmap.dart';
import 'package:optilife_app/features/progress/widgets/weight_chart.dart';
import 'package:optilife_app/features/progress/widgets/workout_consistency_card.dart';

class ProgressScreen extends StatefulWidget {
  const new({super.key});
  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEBF2),
      appBar: AppBar(
        title: Text('Progress'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'Progress & Metrics',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Tracking consistency over perfection',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: CircleAvatar(
                backgroundColor: Colors.teal.shade50,
                child: Icon(Icons.auto_graph, color: Colors.teal.shade700),
              ),
            ),
            WeightChart(weights: [70, 72, 72.2, 74, 74.1]),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: WorkoutConsistencyCard(
                      totalDays: now.day,
                      activeDays: 23,
                    ),
                  ),
                  Expanded(
                    child: ActiveStreakCard(streakCount: 8, isBest: true),
                  ),
                ],
              ),
            ),
            ActivityHeatmap(year: now.year, month: now.month),
          ],
        ),
      ),
    );
  }
}
