import 'package:flutter/material.dart';
import 'package:optilife_app/pages/fitness_baseline_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'optilife app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const FitnessBaselinePage(),
    );
  }
}
