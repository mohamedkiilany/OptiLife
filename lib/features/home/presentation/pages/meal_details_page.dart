import 'package:flutter/material.dart';
import 'package:optilife_app/core/models/meal.dart';
import 'package:optilife_app/features/home/presentation/widgets/meal_detail_components.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({
    super.key,
    required this.meal,
    this.budgetLevel = 'Medium',
    this.image = 'assets/images/food.jpeg',
  });

  final Meal meal;
  final String budgetLevel;
  final String image;

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  int servings = 1;
  int selectedTab = 0;

  final Color navy = const Color(0xFF17243D);
  final Color green = const Color(0xFF0A7A35);
  final Color teal = const Color(0xFF006A63);
  final Color lightBlue = const Color(0xFFE2E7FF);
  final Color brown = const Color(0xFF7A4A00);

  Widget macroCard(
    String emoji,
    String label,
    int grams,
    int ratio,
    Color color,
  ) =>
      MealMacroCard(
        emoji: emoji,
        label: label,
        grams: grams,
        ratio: ratio,
        color: color,
        navy: navy,
        trackColor: lightBlue,
      );

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    final int currentCalories = meal.calories * servings;
    final int currentProtein = (meal.protein * servings).round();
    final int currentFats = (meal.fat * servings).round();
    final int currentCarbs = (meal.carbs * servings).round();

    final double totalMacroKcal =
        (meal.protein * 4) + (meal.fat * 9) + (meal.carbs * 4);
    final int proteinRatio = totalMacroKcal > 0
        ? ((meal.protein * 4 / totalMacroKcal) * 100).round()
        : 0;
    final int fatsRatio = totalMacroKcal > 0
        ? ((meal.fat * 9 / totalMacroKcal) * 100).round()
        : 0;
    final int carbsRatio = totalMacroKcal > 0
        ? ((meal.carbs * 4 / totalMacroKcal) * 100).round()
        : 0;

    final String category =
        '${meal.type.name.toUpperCase()} • ${meal.prepMinutes} MIN PREP';

    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F6FF),
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: navy),
        ),
        title: Row(
          children: [
            const SizedBox(width: 10),
            Text(
              'Meal Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: lightBlue,
              child: Icon(Icons.person, color: navy),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          widget.image,
                          width: double.infinity,
                          height: 290,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Row(
                          children: [
                            MealCircleIcon(
                              icon: Icons.favorite_border,
                              color: navy,
                            ),
                            const SizedBox(width: 8),
                            MealCircleIcon(
                              icon: Icons.share_outlined,
                              color: navy,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 12,
                        bottom: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                'SERVINGS',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(width: 10),
                              MealStepButton(
                                icon: Icons.remove,
                                background: lightBlue,
                                foreground: navy,
                                onTap: () {
                                  if (servings > 1) {
                                    setState(() => servings--);
                                  }
                                },
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '$servings',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: navy,
                                ),
                              ),
                              const SizedBox(width: 12),
                              MealStepButton(
                                icon: Icons.add,
                                background: lightBlue,
                                foreground: navy,
                                onTap: () {
                                  setState(() => servings++);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: teal),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: teal,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: lightBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${widget.budgetLevel} Budget',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    meal.name,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      MealInfoChip(
                        icon: Icons.timer_outlined,
                        text: '${meal.prepMinutes} min prep',
                        background: const Color(0xFFE3F5F2),
                        foreground: teal,
                      ),
                      MealInfoChip(
                        icon: Icons.payments_outlined,
                        text: '${widget.budgetLevel} budget',
                        background: const Color(0xFFFFDDB8),
                        foreground: brown,
                      ),
                      MealInfoChip(
                        icon: Icons.local_fire_department_outlined,
                        text: '$currentCalories kcal',
                        background: lightBlue,
                        foreground: navy,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      macroCard(
                        '🥩',
                        'Protein',
                        currentProtein,
                        proteinRatio,
                        green,
                      ),
                      const SizedBox(width: 10),
                      macroCard(
                        '🥑',
                        'Fats',
                        currentFats,
                        fatsRatio,
                        const Color(0xFFF59E0B),
                      ),
                      const SizedBox(width: 10),
                      macroCard(
                        '🌾',
                        'Carbs',
                        currentCarbs,
                        carbsRatio,
                        teal,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        MealDetailTab(
                          text: 'Ingredients (${meal.ingredients.length})',
                          index: 0,
                          selectedIndex: selectedTab,
                          onTap: (index) => setState(() => selectedTab = index),
                          navy: navy,
                        ),
                        MealDetailTab(
                          text: 'Steps (${meal.steps.length})',
                          index: 1,
                          selectedIndex: selectedTab,
                          onTap: (index) => setState(() => selectedTab = index),
                          navy: navy,
                        ),
                        MealDetailTab(
                          text: 'Nutrition',
                          index: 2,
                          selectedIndex: selectedTab,
                          onTap: (index) => setState(() => selectedTab = index),
                          navy: navy,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (selectedTab == 0)
                    Column(
                      children: [
                        for (final item in meal.ingredients)
                          MealWhiteCard(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: green,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: navy,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  if (selectedTab == 1)
                    Column(
                      children: [
                        for (int i = 0; i < meal.steps.length; i++)
                          MealWhiteCard(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: teal,
                                  child: Text(
                                    '${i + 1}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    meal.steps[i],
                                    style: TextStyle(fontSize: 14, color: navy),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  if (selectedTab == 2)
                    MealWhiteCard(
                      child: Column(
                        children: [
                          MealInfoRow(
                            label: 'Calories',
                            value: '$currentCalories kcal',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Protein',
                            value: '${currentProtein}g ($proteinRatio%)',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Fats',
                            value: '${currentFats}g ($fatsRatio%)',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Carbs',
                            value: '${currentCarbs}g ($carbsRatio%)',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Prep time',
                            value: '${meal.prepMinutes} mins',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Budget level',
                            value: widget.budgetLevel,
                            navy: navy,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TOTAL CALORIES',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '$currentCalories kcal',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: green,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text(
                      'Mark as Eaten',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
}