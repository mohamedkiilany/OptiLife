import 'package:flutter/material.dart';

class ActivityHeatmap extends StatelessWidget {
  final int year;
  final int month;
  final Map<int, int> activityLevels;

  const ActivityHeatmap({
    super.key,
    required this.year ,
    required this.month ,
    this.activityLevels = const {
      1: 1, 2: 1, 3: 2, 4: 3, 5: 2,
      6: 3, 7: 2, 8: 1, 9: 3, 11: 2, 12: 3,
      13: 3, 14: 2, 15: 3, 16: 2, 17: 3, 19: 1,
      20: 3, 21: 3, 22: 3, 23: 3, 24: 3, 25: 3, 26: 3,
    },
  });

  static const _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  Color _getColor(int level) {
    switch (level) {
      case 1:
        return const Color(0xFFA7F3D0);
      case 2:
        return const Color(0xFF4ADE80);
      case 3:
        return const Color(0xFF16A34A);
      default:
        return const Color(0xFFF1F5F9);
    }
  }

  @override
  Widget build(BuildContext context) {
    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    final firstDayOfMonth = DateTime(year, month, 1);
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final daysInPrevMonth = DateTime(year, month, 0).day;
    final leadingDays = firstDayOfMonth.weekday - 1;
    final totalCells = ((leadingDays + daysInMonth) / 7).ceil() * 7;

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.calendar_today_outlined, size: 18, color: Color(0xFF16A34A)),
                  SizedBox(width: 8),
                  Text(
                    'Consistency Heatmap',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              Text(
                '${_months[month - 1]} $year',
                style: const TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: days
                .map((d) => Text(d, style: const TextStyle(color: Colors.grey, fontSize: 12)))
                .toList(),
          ),
          const SizedBox(height: 8),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCells,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              final dayOffset = index - leadingDays + 1;
              final isCurrentMonth = dayOffset >= 1 && dayOffset <= daysInMonth;

              late final int displayDay;
              if (dayOffset < 1) {
                displayDay = daysInPrevMonth + dayOffset;
              } else if (dayOffset > daysInMonth) {
                displayDay = dayOffset - daysInMonth; 
              } else {
                displayDay = dayOffset;
              }

              final level = isCurrentMonth ? (activityLevels[displayDay] ?? 0) : 0;

              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _getColor(level),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$displayDay',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: !isCurrentMonth
                        ? Colors.grey.shade400
                        : (level >= 2 ? Colors.white : Colors.black87),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 14),

          // Bottom Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Less active', style: TextStyle(fontSize: 12, color: Colors.black54)),
              Row(
                children: List.generate(4, (i) {
                  return Container(
                    width: 14,
                    height: 14,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: _getColor(i),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              const Text('Target reached', style: TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }
}