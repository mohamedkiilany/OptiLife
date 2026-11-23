import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';

class WorkoutMatchCard extends StatelessWidget {
   const WorkoutMatchCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    required this.location,
    required this.equipment,
    required this.effort,
    required this.calories,
    required this.buttonColor,
    this.image,
    this.topMatch = false,
    this.phases = false,
    this.category,
    this.compact = false,
    this.buttonTextColor = Colors.white,
    this.onPreview,
  });

  final String title;
  final String description;
  final String duration;
  final String location;
  final String equipment;
  final String effort;
  final String calories;
  final String? image;
  final String? category;
  final bool topMatch;
  final bool phases;
  final bool compact;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback? onPreview;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color(0x18192333),
          blurRadius: 9,
          offset: Offset(0, 3),
        ),
      ],
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null) _WorkoutImage(image: image!, topMatch: topMatch, category: category, calories: calories),
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 12, 13, 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (compact)
                Row(
                  children: [
                    const Icon(Icons.circle, size: 9, color: Color(0xFF50D684)),
                    const SizedBox(width: 5),
                    Text(
                      category ?? '',
                      style: const TextStyle(
                        fontSize: 9,
                        color: Color(0xFF007333),
                        fontWeight: FontWeight.w800,
                        letterSpacing: .4,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      calories,
                      style: const TextStyle(
                        color: Color(0xFF9B5C00),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF182238),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 11.5,
                  height: 1.35,
                  color: Color(0xFF526052),
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  _InfoChip(icon: Icons.timer_outlined, text: duration, color: const Color(0xFFEAF0FF)),
                  _InfoChip(icon: Icons.home_outlined, text: location, color: const Color(0xFFE6F7F4)),
                  _InfoChip(icon: Icons.fitness_center, text: equipment, color: const Color(0xFFF0F1F4)),
                  _InfoChip(icon: Icons.bolt, text: effort, color: const Color(0xFFFFF3E4)),
                ],
              ),
              if (phases) ...[
                const SizedBox(height: 11),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2FF),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _WorkoutPhase(title: 'Warm-up', time: '3m'),
                      _WorkoutPhase(title: 'Core & Glutes', time: '14m'),
                      _WorkoutPhase(title: 'Cool-down', time: '3m'),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 11),
              SizedBox(
                width: double.infinity,
                height: 43,
                child: FilledButton.icon(
                  onPressed: onPreview,
                  icon: Icon(Icons.play_circle_fill, color:AppColors.badge, size: 18),
                  label: Text(
                    'Preview Workout',
                    style: TextStyle(color:AppColors.badge , fontWeight: FontWeight.w700),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.darkGreen,
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _WorkoutImage extends StatelessWidget {
  const _WorkoutImage({required this.image, required this.topMatch, required this.category, required this.calories});
  final String image;
  final bool topMatch;
  final String? category;
  final String calories;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 152,
    width: double.infinity,
    child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: const Color(0xFFE4EEE5),
            child: const Icon(Icons.fitness_center, size: 48, color: Color(0xFF007333)),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black26, Colors.transparent, Colors.black54],
            ),
          ),
        ),
        if (topMatch)
          const Positioned(
            left: 10,
            top: 10,
            child: _Badge(text: 'TOP MATCH FOR TODAY', color: Color(0xFF007333)),
          ),
        if (category != null)
          Positioned(
            left: 10,
            bottom: 9,
            child: _Badge(text: category!, color: const Color(0xB5222937)),
          ),
        Positioned(
          right: 10,
          bottom: 9,
          child: Text(
            calories,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

class _WorkoutPhase extends StatelessWidget {
  const _WorkoutPhase({required this.title, required this.time});
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Icon(Icons.circle, size: 8, color: AppColors.primaryTeal),
      const SizedBox(width: 4),
      Text('$title\n($time)', style: const TextStyle(fontSize: 12, color: AppColors.navy)),
    ],
  );
}

class _Badge extends StatelessWidget {
  const _Badge({required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
  );
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.text, required this.color});
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 11, color: AppColors.darkGreen),
        const SizedBox(width: 3),
        Text(text, style: const TextStyle(fontSize: 9, color:AppColors.darkGreen, fontWeight: FontWeight.w600)),
      ],
    ),
  );
}
