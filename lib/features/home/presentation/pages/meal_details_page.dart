import 'package:flutter/material.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({super.key});

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  String image = 'assets/images/food.jpeg';
  String category = 'BALANCED PLATE • QUICK PREP';
  String tier = 'Tier 1 Energy';
  String title = 'Mediterranean Herb Salmon & Quinoa Bowl';
  String description =
      'Zesty lemon-oregano glazed fillet nestled over warm quinoa, wilted baby greens, and crisp garden cucumbers.';
  String satiety = 'High Satiety';
  int prepMinutes = 15;
  double cost = 3.85;
  int calories = 480;

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

  String money(double value) {
    return '\$' + value.toStringAsFixed(2);
  }

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
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: const Color(0xFF22C55E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.bolt, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text('Activity Detail',
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
                            circleIcon(Icons.favorite_border),
                            const SizedBox(width: 8),
                            circleIcon(Icons.share_outlined),
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
                              stepButton(Icons.remove, () {
                                if (servings > 1) {
                                  setState(() {
                                    servings--;
                                  });
                                }
                              }),
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
                              stepButton(Icons.add, () {
                                setState(() {
                                  servings++;
                                });
                              }),
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
                      infoChip(
                        Icons.timer_outlined,
                        '$prepMinutes min prep',
                        const Color(0xFFE3F5F2),
                        teal,
                      ),
                      const SizedBox(width: 8),
                      infoChip(
                        Icons.payments_outlined,
                        '${money(currentCost)} / serving',
                        const Color(0xFFFFDDB8),
                        brown,
                      ),
                      const SizedBox(width: 8),
                      infoChip(
                        Icons.local_fire_department_outlined,
                        '$currentCalories kcal',
                        lightBlue,
                        navy,
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
                  if (hasSwap) swapCard(),
                  if (hasSwap) const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        tabItem('Ingredients (${ingredients.length})', 0),
                        tabItem('Steps (${steps.length})', 1),
                        tabItem('Nutrition & Cost', 2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (selectedTab == 0)
                    Column(
                      children: [
                        for (var item in ingredients) ingredientCard(item),
                      ],
                    ),
                  if (selectedTab == 1)
                    Column(
                      children: [
                        for (int i = 0; i < steps.length; i++)
                          whiteCard(
                            Row(
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
                    whiteCard(
                      Column(
                        children: [
                          infoRow('Calories', '$currentCalories kcal'),
                          infoRow('Protein', '${currentProtein}g'),
                          infoRow('Fats', '${currentFats}g'),
                          infoRow('Carbs', '${currentCarbs}g'),
                          infoRow('Cost per serving', money(currentCost)),
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

  Widget circleIcon(IconData icon) {
    return Container(
      width: 42,
      height: 42,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: navy, size: 22),
    );
  }

  Widget stepButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(color: lightBlue, shape: BoxShape.circle),
        child: Icon(icon, size: 16, color: navy),
      ),
    );
  }

  Widget infoChip(IconData icon, String text, Color bg, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget macroCard(
    String emoji,
    String label,
    int grams,
    int ratio,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$emoji $label', style: TextStyle(fontSize: 12, color: navy)),
            const SizedBox(height: 6),
            Text(
              '${grams}g',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: navy,
              ),
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: ratio / 100,
              minHeight: 6,
              color: color,
              backgroundColor: lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 6),
            Text(
              '$ratio% ratio',
              style: const TextStyle(fontSize: 11, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget swapCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE6C7),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.savings, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Smart Budget Swap',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: navy,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD28A),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Save ${money(swapSavings)}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: brown,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      swapText,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      swapHighlight,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    swapApplied = false;
                  });
                },
                child: const Text(
                  'Keep Original',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    swapApplied = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF59E0B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: Icon(swapApplied ? Icons.check : Icons.sync),
                label: Text(
                  swapApplied ? 'Swap Applied' : 'Apply Swap',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tabItem(String text, int index) {
    bool selected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = index;
          });
        },
        child: Container(
          height: 54,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: selected ? FontWeight.bold : FontWeight.w600,
              color: selected ? navy : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }

  Widget whiteCard(Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  Widget ingredientCard(Map<String, dynamic> item) {
    return whiteCard(
      Column(
        children: [
          Row(
            children: [
              item['available'] == true
                  ? CircleAvatar(
                      radius: 14,
                      backgroundColor: green,
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  : Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black26, width: 2),
                      ),
                    ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                    Text(
                      item['detail'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                money(item['price']),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: navy,
                ),
              ),
            ],
          ),
          if (item['hint'] != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF1EFFF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    size: 18,
                    color: Color(0xFFF59E0B),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item['hint'],
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: brown,
                      ),
                    ),
                  ),
                  Icon(Icons.swap_horiz, size: 20, color: brown),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, color: navy),
          ),
        ],
      ),
    );
  }
}
