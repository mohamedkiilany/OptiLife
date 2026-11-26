import 'package:flutter/material.dart';
import 'package:optilife_app/app.dart';
import 'package:optilife_app/features/wizard/screens/settings.dart';
import 'package:optilife_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MaterialApp(home: Settings(),));
}