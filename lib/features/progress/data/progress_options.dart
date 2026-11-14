import 'package:flutter/material.dart';
import 'package:optilife_app/features/progress/models/progress_option.dart';

const goalOptions = <ProgressOption>[
  ProgressOption(
    title: 'Lose Weight & Tone',
    description: 'Calorie-aware, high-efficiency fat burn routines with satiety-focused meals',
    icon: Icons.local_fire_department,
    tags: ['⏱ 20-30 min', '🥑 High Protein'],
    popular: true,
  ),
  ProgressOption(
    title: 'Gain Lean Muscle',
    description: 'Progressive bodyweight & resistance moves paired with protein-dense meals',
    icon: Icons.fitness_center,
    tags: ['🏋 Hypertrophy', '🥑 Caloric Surplus'],
  ),
  ProgressOption(
    title: 'Maintain & Healthy Habit',
    description: 'Consistent micro-habits, balanced nutrition, and steady daily vitality',
    icon: Icons.balance,
    tags: ['🌱 Sustainable Pace', '💧 Habit Stacking'],
  ),
  ProgressOption(
    title: 'Boost Energy & Stamina',
    description: 'Cardio mobility flows, fatigue-reducing meals, and restorative sleep pacing',
    icon: Icons.bolt,
    tags: ['⚡ High Vitality', '🌙 Sleep Hygiene'],
  ),
];

const availableTimeOptions = <ProgressOption>[
  ProgressOption(
    title: '10 Minutes',
    description: 'Micro-movements & express prep',
    icon: Icons.access_time,
    badge: 'Busy schedules',
    tags: ['⏱ 7m Movement', '🥗 3m Fast Fuel'],
  ),
  ProgressOption(
    title: '20 Minutes',
    description: 'Optimal balance of strength, mobility, and quick nourishing recipes',
    icon: Icons.access_time,
    recommended: true,
    tags: ['↗ 12m Full Activation', '🍴 8m One-Pan Assembly'],
  ),
  ProgressOption(
    title: '30 Minutes',
    description: 'Comprehensive routine + balanced cooking sessions',
    icon: Icons.access_time,
    badge: 'Solid routine',
    tags: ['⏱ 18m Training', '🍳 12m Balanced Meal'],
  ),
  ProgressOption(
    title: '45+ Minutes',
    description: 'Full progressive training and multi-course meal preparation',
    icon: Icons.timer_outlined,
    badge: 'Deep impact',
    tags: ['⏱ 30m Complete Lift', '🍽 15m Fresh Gourmet'],
  ),
];
