import 'package:flutter/material.dart';
import 'package:optilife_app/core/services/test_screen.dart';
import 'package:optilife_app/features/wizard/screens/whatcanido.dart';




void main() {WidgetsFlutterBinding.ensureInitialized();



runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ( MaterialApp(home: TestPlanScreen()));
    } 
  }

