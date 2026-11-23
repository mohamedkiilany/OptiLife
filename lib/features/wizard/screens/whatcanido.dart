import 'dart:math';
import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/screens/workout_preview_screen.dart';
import 'package:optilife_app/features/wizard/widgets/activity_match_controls.dart';
import 'package:optilife_app/features/wizard/widgets/consistency_tip.dart';
import 'package:optilife_app/features/wizard/widgets/workout_match_card.dart';

class WhatCanDo extends StatefulWidget {
  const WhatCanDo({super.key});

  @override
  State<WhatCanDo> createState() => _WhatCanDoState();
}

class _WhatCanDoState extends State<WhatCanDo> {
  String selectedTime = '20';
  String selectedEnergy = 'normal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Activity Detail',
          style: TextStyle(
            color: AppColors.darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/Profile.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               _MatcherIntro(),
              const SizedBox(height: 14),
              ActivityMatchControls(
                selectedTime: selectedTime,
                selectedEnergy: selectedEnergy,
                onTimeChanged: (value) => setState(() => selectedTime = value),
                onEnergyChanged: (value) =>
                    setState(() => selectedEnergy = value),
                onSurpriseMe: _surpriseMe,
              ),
              const SizedBox(height: 25),
               _MatchesHeading(),
              const SizedBox(height: 13),
              WorkoutMatchCard(
                title: '20-Min No-Jumper Full Body Flow',
                description:
                    'Zero jumping, apartment-friendly sequence crafted to protect joints while maximizing fat oxidation and stamina.',
                image: 'assets/images/workout_at_home.jpg',
                duration: '20 min',
                location: 'Home',
                equipment: 'No equipment',
                effort: 'Moderate',
                calories: '175 kcal',
                topMatch: true,
                phases: true,
                buttonColor: AppColors.darkGreen,
                onPreview: () => _openWorkoutPreview(
                  context,
                  title: '20-Min No-Jumper Full Body Flow',
                  description:
                      'Zero jumping, apartment-friendly sequence crafted to protect joints while maximizing fat oxidation and stamina.',
                  duration: '20 min',
                  image: 'assets/images/workout_at_home.jpg',
                ),
              ),
              const SizedBox(height: 13),
              WorkoutMatchCard(
                title: 'Express Dumbbell Upper Sculpt',
                description:
                    'Targeted triceps, shoulders, and postural stabilizers designed for fast metabolic conditioning.',
                image: 'assets/images/workout.png',
                duration: '20 min',
                location: 'Home',
                equipment: 'Pair of dumbbells',
                effort: 'Medium-High',
                calories: '210 kcal',
                category: 'Upper Body Focus',
                buttonColor: AppColors.darkGreen,
                onPreview: () => _openWorkoutPreview(
                  context,
                  title: 'Express Dumbbell Upper Sculpt',
                  description:
                      'Targeted triceps, shoulders, and postural stabilizers designed for fast metabolic conditioning.',
                  duration: '20 min',
                  image: 'assets/images/workout.png',
                ),
              ),
              const SizedBox(height: 13),
              WorkoutMatchCard(
                title: 'Deep Core & Posture Reset',
                description:
                    'Unwind desk tension, activate dormant transversus abdominis, and align spinal discs without heavy strain.',
                duration: '15 min',
                location: 'Floor mat only',
                equipment: 'Gentle Flow',
                effort: 'Low-Medium',
                calories: '120 kcal',
                category: 'MOBILITY & CORE',
                compact: true,
                buttonColor: AppColors.darkGreen,
                buttonTextColor: Color(0xFF182238),
                onPreview: () => _openWorkoutPreview(
                  context,
                  title: 'Deep Core & Posture Reset',
                  description:
                      'Unwind desk tension, activate dormant transversus abdominis, and align spinal discs without heavy strain.',
                  duration: '15 min',
                ),
              ),
              const SizedBox(height: 13),
              const ConsistencyTip(),
            ],
          ),
        ),
      ),
    );
  }

  void _surpriseMe() {
    final random = Random();
    setState(() {
      selectedTime = ['10', '20', '30', '45+'][random.nextInt(4)];
      selectedEnergy = ['low', 'normal', 'high'][random.nextInt(3)];
    });
  }

  void _openWorkoutPreview(
    BuildContext context, {
    required String title,
    required String description,
    required String duration,
    String? image,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => WorkoutPreviewScreen(
          title: title,
          description: description,
          duration: duration,
          image: image,
        ),
      ),
    );
  }
}

class _MatcherIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.bolt, color: Color(0xFF007333), size: 18),
          SizedBox(width: 3),
          Text(
            'INSTANT SMART MATCHER',
            style: TextStyle(
              color: Color(0xFF007333),
              fontSize: 13,
              letterSpacing: .4,
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Text(
        'What can I do today?',
        style: TextStyle(
          fontSize: 23,
          height: 1.15,
          fontWeight: FontWeight.w800,
          color: Color(0xFF182238),
        ),
      ),
      SizedBox(height: 5),
      Text(
        'Tell us your time & energy. We adapt the workout instantly.',
        style: TextStyle(color: Color(0xFF4D594F), height: 1.35),
      ),
    ],
  );
}

class _MatchesHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Row(
    children: [
      Text(
        "Today's Matches",
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF182238),
        ),
      ),
      SizedBox(width: 9),
      _MatchCount(),
      Spacer(),
      Text(
        'Zero equipment needed',
        style: TextStyle(fontSize: 11, color: Color(0xFF687568)),
      ),
    ],
  );
}

class _MatchCount extends StatelessWidget {
  const _MatchCount();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: const BoxDecoration(
      color: Color(0xFFD8F4E6),
      shape: BoxShape.circle,
    ),
    child: const Text(
      '3',
      style: TextStyle(
        color: Color(0xFF007333),
        fontSize: 11,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
