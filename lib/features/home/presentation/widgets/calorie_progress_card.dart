
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class CalorieProgressCard extends StatelessWidget {
  final int currentCalories;
  final int goalCalories;
  final Color activeColor;
  final Color trackColor;

  const CalorieProgressCard({
    super.key,
    required this.currentCalories,
    required this.goalCalories,
    this.activeColor = AppColors.lightGreen,
    this.trackColor = AppColors.unSelectedCard,
  });

  double get progress {
    if (goalCalories == 0) {
      return 0;
    }

    return (currentCalories / goalCalories).clamp(0.0, 1.0);
  }

  int get percentage {
    return (progress * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF101828).withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildProgressIndicator(),
          const SizedBox(height: 1),
          buildCaloriesSummary(),
        ],
      ),
    );
  }

  Widget buildProgressIndicator() {
    return SizedBox(
      width: 115,
      height: 115,
      child: CustomPaint(
        painter: CircularProgressPainter(
          progress: progress,
          activeColor: activeColor,
          trackColor: trackColor,
          strokeWidth: 11,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.bolt_rounded,
                color: activeColor,
                size: 26,
              ),
              const SizedBox(height: 2),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111827),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCaloriesSummary() {
    return Column(
      children: [
        Text(
          formatNumber(currentCalories),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF111827),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '/ ${formatNumber(goalCalories)} kcal goal',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  String formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color activeColor;
  final Color trackColor;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.activeColor,
    required this.trackColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = (size.width - strokeWidth) / 2;

    final trackPaint = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, trackPaint);

    final progressPaint = Paint()
      ..color = activeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    const startAngle = 2.95;
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.trackColor != trackColor;
  }
}
