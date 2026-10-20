import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF00783F),
                    child: Icon(Icons.eco, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'OptiLife',
                    style: TextStyle(
                      color: AppColors.navy,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                  child: Column(
                    children: [
                      _routineCard(),
                      const SizedBox(height: 26),
                      const Text(
                        'Plans fit your real time & life',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.navy,
                          fontSize: 27,
                          height: 1.15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Only have 10 or 20 minutes? No equipment or a tight '
                        'budget? OptiLife generates wellness routines that '
                        'adapt to your constraints, not the other way around.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 15,
                          height: 1.45,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        runSpacing: 5,
                        children: [
                          _Pill(Icons.check_circle, 'No gym required'),
                          _Pill(Icons.check_circle, 'Cheap whole foods'),
                          _Pill(Icons.check_circle, 'Zero guilt shifts'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 65),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () => context.go(AppRouter.signin),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColors.primaryGreen,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(' Let`s Start ', style: TextStyle(fontSize: 20)),
                        Icon(Icons.arrow_forward, size: 25),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _routineCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFEFF0FF), Color(0xFFD4F7EA)],
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.circle, color: AppColors.primaryTeal, size: 14),
                    SizedBox(width: 8),
                    Text(
                      'ACTIVE ROUTINE',
                      style: TextStyle(
                        color: Color(0xFF00783F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    _Pill(null, 'Today'),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDDF7E9),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.self_improvement,
                        color: Color(0xFF009B61),
                        size: 44,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gentle Morning Mobility',
                            style: TextStyle(
                              color: AppColors.navy,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Low-impact flow for quiet spaces',
                            style: TextStyle(color: AppColors.muted),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 6,
                  runSpacing: 0,
                  children: [
                    _Pill(Icons.access_time, '15 min workout'),
                    _Pill(Icons.restaurant, '\$2.80 meal'),
                    _Pill(Icons.apartment, 'Zero noise'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF8DEDE0),
                  child: Icon(Icons.tune, color: AppColors.navy),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Effortless Micro-Steps',
                        style: TextStyle(
                          color: AppColors.navy,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Calibrated for your exact energy',
                        style: TextStyle(color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryGreen,
                  child: Icon(Icons.check, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.icon, this.label);

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) => Chip(
        avatar: icon == null
            ? null
            : Icon(icon, size: 16, color: const Color(0xFF00783F)),
        label: Text(label),
        backgroundColor: const Color(0xFFE9EDFF),
        side: BorderSide.none,
        visualDensity: VisualDensity.compact,
      );
}
