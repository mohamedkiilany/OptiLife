import 'package:flutter/material.dart';
import 'package:optilife_app/wizard%20steps/available_time_screen.dart';


class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  int selectedIndex = -1;

  final Color green = const Color(0xFF22C55E);
  final Color darkGreen = const Color(0xFF166534);
  final Color darkText = const Color(0xFF111827);

  final List<Map<String, dynamic>> goals = [
    {
      'title': 'Lose Weight & Tone',
      'desc': 'Calorie-aware, high-efficiency fat burn routines with satiety-focused meals',
      'icon': Icons.local_fire_department,
      'tags': ['⏱ 20-30 min', '🥑 High Protein'],
    },
    {
      'title': 'Gain Lean Muscle',
      'desc': 'Progressive bodyweight & resistance moves paired with protein-dense meals',
      'icon': Icons.fitness_center,
      'tags': ['🏋 Hypertrophy', '🥑 Caloric Surplus'],
    },
    {
      'title': 'Maintain & Healthy Habit',
      'desc': 'Consistent micro-habits, balanced nutrition, and steady daily vitality',
      'icon': Icons.balance,
      'tags': ['🌱 Sustainable Pace', '💧 Habit Stacking'],
    },
    {
      'title': 'Boost Energy & Stamina',
      'desc': 'Cardio mobility flows, fatigue-reducing meals, and restorative sleep pacing',
      'icon': Icons.bolt,
      'tags': ['⚡ High Vitality', '🌙 Sleep Hygiene'],
    },
  ];

  Widget buildGoalCard(int index) {
    bool isSelected = selectedIndex == index;
    Map<String, dynamic> goal = goals[index];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F8EC) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? green : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected ? green : const Color(0xFFE0E4FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                goal['icon'],
                color: isSelected ? Colors.white : darkText,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          goal['title'],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: darkText,
                          ),
                        ),
                      ),
                      if (index == 0) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3E8B5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Popular',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    goal['desc'],
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: [
                      for (String tag in goal['tags'])
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0E4FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0F766E),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isSelected ? green : const Color(0xFFE0E4FF),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back),
                  const Text(
                    'Wizard Step 1 Goal',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.help_outline),
                      const SizedBox(width: 12),
                      Text(
                        'Skip',
                        style: TextStyle(
                          color: darkGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        backgroundColor: darkGreen,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: 1 / 8,
              color: green,
              backgroundColor: Colors.white,
              minHeight: 3,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCCF5EC),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '‹ PERSONALIZED BLUEPRINT',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F766E),
                            ),
                          ),
                        ),
                        const Text(
                          'Step 1 of 8',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "What's your primary wellness goal?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: darkText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "We'll adapt routine intensity, meal macros, and daily pace to this target.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    for (int i = 0; i < goals.length; i++) buildGoalCard(i),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE0E4FF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.lock_outline, color: green),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Zero judgment promise:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'You can switch your primary goal or fine-tune daily priorities anytime in your profile settings without losing historical progress.',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  if (selectedIndex == -1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please select a goal first'),
                        backgroundColor: darkGreen,
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AvailableTimeScreen(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}