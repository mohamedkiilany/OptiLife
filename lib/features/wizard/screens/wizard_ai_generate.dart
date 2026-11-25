import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/cubit/selection_cubit.dart';
import 'package:optilife_app/features/wizard/cubit/selection_state.dart';
import 'package:optilife_app/features/wizard/widgets/generation_checklist_card.dart';
import 'package:optilife_app/features/wizard/widgets/generation_progress_ring.dart';

class WizardAiGenerate extends StatefulWidget {
  const WizardAiGenerate({super.key});

  @override
  State<WizardAiGenerate> createState() => _WizardAiGenerateState();
}

class _WizardAiGenerateState extends State<WizardAiGenerate> {
  static const _stepDuration = Duration(milliseconds: 900);
  int _completedChecks = 0;

  @override
  void initState() {
    super.initState();
    unawaited(_runChecks());
  }

  Future<void> _runChecks() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    for (var step = 1; step <= 5; step++) {
      await Future<void>.delayed(_stepDuration);
      if (!mounted) return;
      setState(() => _completedChecks = step);
    }
    await Future<void>.delayed(const Duration(milliseconds: 650));
    if (mounted) context.go(AppRouter.home);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectionCubit, SelectionState>(
      builder: (context, state) {
        final items = _generationItems(state);
        final progress = _completedChecks / items.length;
        final userName = state.name?.trim().isNotEmpty == true
            ? state.name!.trim()
            : 'you';

        return Scaffold(
          backgroundColor: const Color(0xFFF9F7FF),
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 12, 18, 8),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'AI Plan Generation',
                              style: TextStyle(
                                color: AppColors.navy,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Text(
                            '${(progress * 100).round()}%',
                            style: const TextStyle(
                              color: AppColors.primaryTeal,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(14, 2, 14, 18),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color(0xFFE5F8F9), Color(0xFFF9F7FF)],
                                  stops: [0, .66],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                                    decoration: BoxDecoration(color: const Color(0xFFD8F1F7), borderRadius: BorderRadius.circular(20)),
                                    child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.eco, size: 14, color: Color(0xFF21865E)), SizedBox(width: 6), Text('OPTILIFE ENGINE V2.4', style: TextStyle(fontSize: 10, letterSpacing: .4, color: Color(0xFF527B72), fontWeight: FontWeight.w800)), SizedBox(width: 7), Icon(Icons.circle, size: 6, color: Color(0xFF20C765))]),
                                  ),
                                  const SizedBox(height: 15),
                                  GenerationProgressRing(progress: progress, status: _completedChecks == 5 ? 'Ready' : _completedChecks == 0 ? 'Starting' : 'Calibrating'),
                                  const SizedBox(height: 12),
                                  const Text('Building your personalized plan…', textAlign: TextAlign.center, style: TextStyle(color: AppColors.navy, fontSize: 18, fontWeight: FontWeight.w800)),
                                  const SizedBox(height: 4),
                                  const Text('Calibrating workouts, nutrition, and recovery to your exact constraints.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF536253), height: 1.35, fontSize: 13)),
                                  const SizedBox(height: 16),
                                  GenerationChecklistCard(items: items, completedCount: _completedChecks),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                const Icon(Icons.verified_user, color: Color(0xFF087A45), size: 15),
                                const SizedBox(width: 6),
                                Flexible(child: Text('${(progress * 100).round()}% Tailored to $userName  •  Zero generic templates', maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, color: AppColors.navy, fontWeight: FontWeight.w700))),
                              ]),
                            ),
                            const SizedBox(height: 12),
                            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF087A45), shape: BoxShape.circle)),
                              const SizedBox(width: 7),
                              Text(_completedChecks == 5 ? 'Your dashboard is ready…' : 'Optimizing your plan for everyday life…', style: const TextStyle(color: Color(0xFF718071), fontSize: 11)),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<GenerationChecklistItem> _generationItems(SelectionState state) {
    final time = state.availableMinutes == null
        ? 'Flexible time window'
        : '${state.availableMinutes} min/day';
    final budget = state.budget ?? 'Flexible grocery budget';
    final workout = [
      if (state.equipment != null) state.equipment!,
      ...state.environments,
    ].join(' • ');
    final diet = state.dietPreferences.isEmpty
        ? 'Balanced meals selected'
        : state.dietPreferences.join(', ');
    final baseline = state.fitnessLevel ?? 'Safe beginner-friendly starting point';

    return [
      GenerationChecklistItem(title: 'Analyzing your available time', tag: time, detail: 'Time-boxed sessions prioritized for your daily schedule.'),
      GenerationChecklistItem(title: 'Matching your grocery budget', tag: budget, detail: 'Meals and pantry choices tuned to your budget.'),
      GenerationChecklistItem(title: 'Filtering workouts for your lifestyle', tag: workout.isEmpty ? 'Flexible setup' : workout, detail: 'Exercises matched to your space and available gear.'),
      GenerationChecklistItem(title: 'Harmonizing dietary preferences', tag: diet, detail: state.dislikedFoods.isEmpty ? 'Balancing macros, pantry staples, and prep time.' : 'Avoiding ${state.dislikedFoods.join(', ')} in your meals.'),
      GenerationChecklistItem(title: 'Synthesizing your weekly blueprint', tag: baseline, detail: 'Final schedule and personalized coaching tips.'),
    ];
  }
}
