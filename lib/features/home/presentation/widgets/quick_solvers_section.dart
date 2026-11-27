import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/home/presentation/pages/fridge_scanner_page.dart';
import 'package:optilife_app/features/home/presentation/widgets/quick_solver_card.dart';
import 'package:optilife_app/features/home/presentation/widgets/schedule_banner.dart';

class QuickSolversSection extends StatelessWidget {
  const QuickSolversSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Quick Solvers',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Spacer(),
              Text(
                'On-Demand',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: AppColors.darkGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: QuickSolverCard(
                    icon: Icons.timer_outlined,
                    iconColor: const Color(0xFF00695C),
                    iconBackground: const Color(0xFFBFE9E0),
                    title: 'What Can I Do Today?',
                    description:
                        'Got 10 or 20 mins? Get instant bodyweight workouts.',
                    actionText: 'Find 10m Routine',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: QuickSolverCard(
                    icon: Icons.kitchen_outlined,
                    iconColor: const Color(0xFF855300),
                    iconBackground: const Color(0xFFFFE0B2),
                    title: 'What Can I Make?',
                    description:
                        'Input ingredients in your fridge for cheap meals.',
                    actionText: 'Open Scanner',
                    color: const Color(0xFF855300),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const FridgeScannerPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ScheduleBanner(onAdjust: () {}),
        ],
      ),
    );
  }
}
