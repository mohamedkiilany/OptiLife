import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/features/profile/data/profile_repository.dart';

extension SaveStepX on BuildContext {
  Future<bool> saveStep(Map<String, dynamic> data) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return false;
    try {
      await read<ProfileRepository>().saveStep(uid, data);
      return true;
    } catch (e) {
      debugPrint('SAVE ERROR: $e');
      return false;
    }
  }
  Future<void> saveAndGo(Map<String, dynamic> data, String route) async {
    final ok = await saveStep(data);
    if (!mounted) return;
    if (!ok) {
      ScaffoldMessenger.of(this).showSnackBar(
        const SnackBar(content: Text('Could not save. Check your connection.')),
      );
      return;
    }
    go(route);
  }
}