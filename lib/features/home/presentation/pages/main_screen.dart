import 'package:flutter/material.dart';
import 'package:optilife_app/features/home/presentation/pages/home_page.dart';
import 'package:optilife_app/features/home/presentation/widgets/custom_bottom_nav.dart';
import 'package:optilife_app/features/profile/presentation/pages/profile.dart';
import 'package:optilife_app/features/progress/screens/progress_screen.dart';
import 'package:optilife_app/features/wizard/screens/whatcanido.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    WhatCanDo(),
    AssistantPage(),
    ProgressScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Progress Page'));
  }
}

class AssistantPage extends StatelessWidget {
  const AssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Assistant Page'));
  }
}

// class PlanPage extends StatelessWidget {
//   const PlanPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Plan Page'));
//   }
// }
