import 'package:flutter/material.dart';
import 'package:optilife_app/features/home/presentation/widgets/meal_detail_components.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({
    super.key,
    this.image = 'assets/images/food.jpeg',
    this.category = 'BALANCED PLATE • QUICK PREP',
    this.title = 'Mediterranean Herb Salmon & Quinoa Bowl',
    this.prepMinutes = 15,
    this.cost = 3.85,
    this.calories = 480,
    this.satiety = 'High Satiety',
  });

  final String image;
  final String category;
  final String title;
  final int prepMinutes;
  final double cost;
  final int calories;
  final String satiety;

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  late String image;
  late String category;
  String tier = 'Tier 1 Energy';
  late String title;
  String description =
      'Zesty lemon-oregano glazed fillet nestled over warm quinoa, wilted baby greens, and crisp garden cucumbers.';
  late String satiety;
  late int prepMinutes;
  late double cost;
  late int calories;

  int protein = 38;
  int fats = 16;
  int carbs = 42;
  int proteinRatio = 45;
  int fatsRatio = 25;
  int carbsRatio = 30;

  bool hasSwap = true;
  double swapSavings = 2.45;
  double swapCost = 1.40;
  int swapCalories = 410;
  int swapProtein = 34;
  int swapFats = 12;
  int swapCarbs = 40;
  int swapProteinRatio = 40;
  int swapFatsRatio = 25;
  int swapCarbsRatio = 35;
  String swapText =
      'Swap fresh Atlantic salmon fillet for Wild Albacore Tuna or organic firm tofu to keep';
  String swapHighlight = '34g protein at only \$1.40/serving.';

  List<Map<String, dynamic>> ingredients = [
    {
      'name': 'Fresh Atlantic Salmon Fillet',
      'detail': '180g • Skin-on',
      'price': 4.20,
      'available': true,
      'hint': 'Save 58% with Canned Wild Salmon or Pastured Eggs',
    },
    {
      'name': 'Cooked Quinoa',
      'detail': '1 cup (185g) • Fluffed',
      'price': 0.65,
      'available': true,
    },
    {
      'name': 'Baby Spinach',
      'detail': '2 cups (60g) • Washed',
      'price': 0.50,
      'available': true,
    },
    {
      'name': 'Extra Virgin Olive Oil & Lemon',
      'detail': '1 tbsp EVOO + 1/2 fresh lemon',
      'price': 0.35,
      'available': true,
    },
    {
      'name': 'Cherry Tomatoes & Cucumbers',
      'detail': '1/2 cup halved & sliced',
      'price': 0.80,
      'available': true,
    },
  ];

  List<String> steps = [
    'Cook the quinoa according to the package, then fluff it with a fork.',
    'Season the salmon with lemon, oregano and olive oil, then pan-sear 3 to 4 minutes on each side.',
    'Toss the spinach, tomatoes and cucumbers with a little olive oil and lemon.',
    'Serve the quinoa and greens in a bowl, top with the salmon and add fresh dill.',
  ];

  int servings = 1;
  int selectedTab = 0;
  bool swapApplied = false;

  Color navy = const Color(0xFF17243D);
  Color green = const Color(0xFF0A7A35);
  Color teal = const Color(0xFF006A63);
  Color lightBlue = const Color(0xFFE2E7FF);
  Color brown = const Color(0xFF7A4A00);

  @override
  void initState() {
    super.initState();
    image = widget.image;
    category = widget.category;
    title = widget.title;
    prepMinutes = widget.prepMinutes;
    cost = widget.cost;
    calories = widget.calories;
    satiety = widget.satiety;
  }

  String money(double value) {
    return '\$${value.toStringAsFixed(2)}';
  }

  Widget macroCard(
    String emoji,
    String label,
    int grams,
    int ratio,
    Color color,
  ) => MealMacroCard(
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
    double currentCost = swapApplied ? swapCost : cost;
    int currentCalories = swapApplied ? swapCalories : calories;
    int currentProtein = swapApplied ? swapProtein : protein;
    int currentFats = swapApplied ? swapFats : fats;
    int currentCarbs = swapApplied ? swapCarbs : carbs;
    int currentProteinRatio = swapApplied ? swapProteinRatio : proteinRatio;
    int currentFatsRatio = swapApplied ? swapFatsRatio : fatsRatio;
    int currentCarbsRatio = swapApplied ? swapCarbsRatio : carbsRatio;

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
            // Container(
            //   width: 34,
            //   height: 34,
            //   decoration: BoxDecoration(
            //     color: const Color(0xFF22C55E),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: const Icon(Icons.bolt, color: Colors.white),
            // ),
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
                          image,
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
                                    setState(() {
                                      servings--;
                                    });
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
                                  setState(() {
                                    servings++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        bottom: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.verified_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                satiety,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          tier,
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
                    title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      MealInfoChip(
                        icon: Icons.timer_outlined,
                        text: '$prepMinutes min prep',
                        background: const Color(0xFFE3F5F2),
                        foreground: teal,
                      ),
                      const SizedBox(width: 8),
                      MealInfoChip(
                        icon: Icons.payments_outlined,
                        text: '${money(currentCost)} / serving',
                        background: const Color(0xFFFFDDB8),
                        foreground: brown,
                      ),
                      const SizedBox(width: 8),
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
                        currentProteinRatio,
                        green,
                      ),
                      const SizedBox(width: 10),
                      macroCard(
                        '🥑',
                        'Fats',
                        currentFats,
                        currentFatsRatio,
                        const Color(0xFFF59E0B),
                      ),
                      const SizedBox(width: 10),
                      macroCard(
                        '🌾',
                        'Carbs',
                        currentCarbs,
                        currentCarbsRatio,
                        teal,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (hasSwap)
                    MealSwapCard(
                      savings: swapSavings,
                      swapText: swapText,
                      highlight: swapHighlight,
                      swapped: swapApplied,
                      money: money,
                      navy: navy,
                      brown: brown,
                      green: green,
                      onKeepOriginal: () => setState(() => swapApplied = false),
                      onApplySwap: () => setState(() => swapApplied = true),
                    ),
                  if (hasSwap) const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        MealDetailTab(
                          text: 'Ingredients (${ingredients.length})',
                          index: 0,
                          selectedIndex: selectedTab,
                          onTap: (index) => setState(() => selectedTab = index),
                          navy: navy,
                        ),
                        MealDetailTab(
                          text: 'Steps (${steps.length})',
                          index: 1,
                          selectedIndex: selectedTab,
                          onTap: (index) => setState(() => selectedTab = index),
                          navy: navy,
                        ),
                        MealDetailTab(
                          text: 'Nutrition & Cost',
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
                        for (var item in ingredients)
                          MealIngredientCard(
                            item: item,
                            money: money,
                            green: green,
                            navy: navy,
                            brown: brown,
                          ),
                      ],
                    ),
                  if (selectedTab == 1)
                    Column(
                      children: [
                        for (int i = 0; i < steps.length; i++)
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
                                    steps[i],
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
                            value: '${currentProtein}g',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Fats',
                            value: '${currentFats}g',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Carbs',
                            value: '${currentCarbs}g',
                            navy: navy,
                          ),
                          MealInfoRow(
                            label: 'Cost per serving',
                            value: money(currentCost),
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
                      'SERVING COST',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      money(currentCost * servings),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.playlist_add, color: navy),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
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
