import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';

class WorkoutDetailsPage extends StatefulWidget {
  const WorkoutDetailsPage({super.key});

  @override
  State<WorkoutDetailsPage> createState() => _WorkoutDetailsPageState();
}

class _WorkoutDetailsPageState extends State<WorkoutDetailsPage> {
  String image = 'assets/images/workout_at_home.jpg';
  String title = '20-Min No-Jumper Full Body Flow';
  String description =
      'Targeted core, glute activation and shoulder stabilizers without waking up downstairs neighbors.';
  int duration = 20;
  String location = 'Home';
  String equipmentLabel = 'No equipment';
  int calories = 185;
  bool quietMode = true;

  String coachMessage = "Calibrated for Mohamed's 20m window & zero equipment.";

  String impactLevel = 'Low Impact';
  List<Map<String, dynamic>> muscles = [
    {'name': 'Core', 'percent': 40},
    {'name': 'Glutes', 'percent': 35},
    {'name': 'Upper', 'percent': 25},
  ];

  List<Map<String, dynamic>> equipment = [
    {'name': 'Floor Mat or Carpet', 'icon': Icons.self_improvement},
    {'name': 'Water Bottle', 'icon': Icons.water_drop_outlined},
    {'name': 'Barefoot Friendly', 'icon': Icons.check_circle_outline},
  ];

  List<Map<String, String>> exercises = [
    {
      'name': 'Cat-Cow Mobility Warmup',
      'detail': '2 mins',
      'tag': 'Gentle flow',
      'image': 'assets/images/exercise_1.jpeg',
    },
    {
      'name': 'Glute Bridge Holds',
      'detail': '3 sets × 12 reps • 45s rest',
      'tag': 'Glutes',
      'image': 'assets/images/exercise_2.jpeg',
    },
    {
      'name': 'Dead Bug Core Stabilizers',
      'detail': '3 sets × 10 reps each',
      'tag': 'Deep Core',
      'image': 'assets/images/exercise_3.jpeg',
    },
    {
      'name': 'Bird Dog Isometric Reach',
      'detail': '3 sets × 10 reps each',
      'tag': 'Stabilizers',
      'image': 'assets/images/exercise_4.jpeg',
    },
    {
      'name': "Child's Pose Decompression",
      'detail': '2 mins',
      'tag': 'Cool-down',
      'image': 'assets/images/exercise_5.jpeg',
    },
  ];

  String impactTitle = 'Zero Impact & Foot-Thud Protected';
  String impactText =
      '100% mat-level movements with zero jumping, making it completely silent for morning or late night sessions.';
  String acousticLabel = 'Acoustic friendly';

  bool isSaved = false;

  Color navy = const Color(0xFF17243D);
  Color green = const Color(0xFF16A34A);
  Color teal = const Color(0xFF006A63);
  Color lightBlue = const Color(0xFFE9EAFF);
  List<Color> muscleColors = [
    const Color(0xFF16A34A),
    const Color(0xFF6FD3C6),
    const Color(0xFFFFB84D),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F6FF),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.go(AppRouter.home),
          icon: Icon(Icons.arrow_back, color: navy),
        ),
        title: Text(
          'Workout Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       isSaved = !isSaved;
          //     });
          //   },
          // icon: Icon(
          //   isSaved ? Icons.bookmark : Icons.bookmark_border,
          //   color: navy,
          // ),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.share_outlined, color: navy),
          // ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        image,
                        width: double.infinity,
                        height: 290,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: heroChip(Icons.play_circle_outline, 'Preview'),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 12,
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            heroChip(Icons.timer_outlined, '$duration min'),
                            heroChip(Icons.home_outlined, location),
                            heroChip(Icons.block, equipmentLabel),
                            heroChip(
                              Icons.local_fire_department_outlined,
                              '$calories kcal',
                            ),
                            // if (quietMode)
                            //   heroChip(Icons.volume_off, 'Quiet Mode'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
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
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            children: [
                              // CircleAvatar(
                              //   backgroundColor: const Color(0xFFCFF2DC),
                              //   child: IconButton(
                              //     onPressed: () => Navigator.pop(context),
                              //     color: green,
                              //     icon: Icon(Icons.chevron_left_outlined),
                              //   ),
                              // ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'OptiLife Coach',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: green,
                                      ),
                                    ),
                                    Text(
                                      coachMessage,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: navy,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        whiteCard(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'MUSCLE INTENSITY FOCUS',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: navy,
                                    ),
                                  ),
                                  Text(
                                    impactLevel,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Row(
                                  children: [
                                    for (int i = 0; i < muscles.length; i++)
                                      Expanded(
                                        flex: muscles[i]['percent'],
                                        child: Container(
                                          height: 8,
                                          color: muscleColors[i],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < muscles.length; i++)
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: 10,
                                          color: muscleColors[i],
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          muscles[i]['name'],
                                          style: TextStyle(color: navy),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${muscles[i]['percent']}%',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: muscleColors[i],
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        whiteCard(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EQUIPMENT NEEDED',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: navy,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  for (var item in equipment)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: lightBlue,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            item['icon'] ??
                                                Icons.check_circle_outline,
                                            size: 18,
                                            color: green,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            item['name'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: navy,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Text(
                              'Exercise Flow',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: navy,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: lightBlue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${exercises.length} Moves',
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Icon(Icons.swap_calls, size: 18, color: green),
                            const SizedBox(width: 4),
                            Text(
                              'Customize Order',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        for (int i = 0; i < exercises.length; i++)
                          exerciseCard(i),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6F3EE),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                impactTitle,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: teal,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                impactText,
                                style: TextStyle(fontSize: 13, color: teal),
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
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse, size: 18, color: green),
                        const SizedBox(width: 6),
                        Text(
                          'Total Time: $duration min',
                          style: TextStyle(fontSize: 14, color: navy),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.volume_off, size: 18, color: teal),
                        const SizedBox(width: 6),
                        Text(
                          acousticLabel,
                          style: TextStyle(fontSize: 14, color: teal),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Workout',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget heroChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xDDFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: navy),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
        ],
      ),
    );
  }

  Widget whiteCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }

  Widget exerciseCard(int index) {
    Map<String, String> exercise = exercises[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  exercise['image']!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.black54,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise['name']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: navy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  exercise['detail']!,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  exercise['tag']!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.swap_horiz, color: Colors.black54),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkoutDetailsPage(),
    ),
  );
}
