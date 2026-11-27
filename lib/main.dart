import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:optilife_app/app.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:optilife_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 await FirebaseAppCheck.instance.activate(
  providerAndroid: const AndroidDebugProvider(
    debugToken: 'abc34331-10f1-4052-b65c-cff9fcf8e887',
  ),
  providerApple: const AppleDebugProvider(),
);
  runApp(App());
}
