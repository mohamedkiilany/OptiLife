import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:optilife_app/features/progress/helper/chart_data_helper.dart';

class WeightChart extends StatelessWidget {
  final List<double> weights;
  const WeightChart({super.key, required this.weights});

  @override
  Widget build(BuildContext context) {
    if (weights.length != 5) throw ArgumentError('weights must contain exactly 5 doubles');

    final spots = [
      FlSpot(0, weights[0]),
      FlSpot(1, weights[1]),
      FlSpot(2, weights[2]),
      FlSpot(3, weights[3]),
      FlSpot(4, weights[4]),
    ];

    final labels = ChartDataHelper.getWeeklyLabels();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CURRENT WEIGHT',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    '${weights[4]} KG',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 180,
                child: LineChart(
                  LineChartData(
                    minY: weights[0]-1,
                    maxY: weights[4]+1,
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            final i = value.toInt();
                            if (i < 0 || i >= labels.length) const SizedBox();
                            final isToday = i == labels.length - 1;
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                labels[i],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: isToday
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isToday
                                      ? Colors.teal
                                      : Colors.grey.shade700,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    lineTouchData: LineTouchData(
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipColor: (_) => const Color(0xFF1E293B),
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((spot) {
                            return LineTooltipItem(
                              '${spot.y} kg',
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: const Color(0xFF007A3D),
                        barWidth: 3,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, bar, index) =>
                              FlDotCirclePainter(
                                radius: index == spots.length - 1 ? 5 : 4,
                                color: Colors.white,
                                strokeWidth: 2.5,
                                strokeColor: index == spots.length - 1
                                    ? const Color(0xFF22C55E)
                                    : const Color(0xFF007A3D),
                              ),
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFF22C55E).withAlpha(100),
                              const Color(0xFF22C55E).withAlpha(0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
