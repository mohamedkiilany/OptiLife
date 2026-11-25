import 'package:flutter/material.dart';

class GenerationProgressRing extends StatelessWidget {
  const GenerationProgressRing({super.key, required this.progress, required this.status});

  final double progress;
  final String status;

  @override
  Widget build(BuildContext context) {
    final percent = (progress * 100).round();
    return SizedBox(
      width: 174,
      height: 174,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 158,
            height: 158,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4,
              strokeCap: StrokeCap.round,
              backgroundColor: const Color(0xFFD9F4E6),
              valueColor: const AlwaysStoppedAnimation(Color(0xFF19C765)),
            ),
          ),
          Container(
            width: 132,
            height: 132,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: const Color(0xFF0EA85C).withValues(alpha: .12), blurRadius: 20)],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.auto_awesome, color: Color(0xFF087A45), size: 25),
                const SizedBox(height: 2),
                Text('$percent', style: const TextStyle(fontSize: 29, height: 1, fontWeight: FontWeight.w800, color: Color(0xFF18233A))),
                const SizedBox(height: 3),
                Text(status, style: const TextStyle(fontSize: 11, color: Color(0xFF536253))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
