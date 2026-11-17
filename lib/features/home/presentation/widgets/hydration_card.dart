import 'package:flutter/material.dart';

class HydrationCard extends StatelessWidget {
  final double currentLiters;
  final double goalLiters;

  const HydrationCard({
    super.key,
    required this.currentLiters,
    required this.goalLiters,
  });

  static const _teal = Color(0xFF00695C);
  static const _tealLight = Color(0xFF7FD6C8);
  static const _track = Color(0xFFE8EEFB);

  @override
  Widget build(BuildContext context) {
    final progress = (currentLiters / goalLiters).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.water_drop, color: _teal, size: 16),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'HYDRATION',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _teal,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(
                  color: _teal,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: _track,
              valueColor: const AlwaysStoppedAnimation(_tealLight),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$currentLiters L',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
              Text(
                'Goal: $goalLiters L',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}