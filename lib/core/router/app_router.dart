import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/go_router_refresh_stream.dart';
import 'package:optilife_app/features/final_wizard/pages/fitness_baseline_page.dart';
import 'package:optilife_app/features/final_wizard/pages/food_avaialbility.dart';
import 'package:optilife_app/features/home/presentation/pages/main_screen.dart';
import 'package:optilife_app/features/profile/data/profile_repository.dart';
import 'package:optilife_app/features/profile/presentation/pages/profile.dart';
import 'package:optilife_app/features/progress/presentation/pages/available_time_screen.dart';
import 'package:optilife_app/features/progress/presentation/pages/goals_screen.dart';
import 'package:optilife_app/features/wizard/screens/active_workout_session.dart';
import 'package:optilife_app/features/wizard/screens/whatcanido.dart';
import 'package:optilife_app/features/wizard/screens/wizard_step_6.dart';
import 'package:optilife_app/features/wizard/screens/wizard5.dart';
import 'package:optilife_app/features/wizard/screens/wizard_step_3.dart';
import 'package:optilife_app/features/wizard/screens/wizard_step_4.dart';
import 'package:optilife_app/features/wizard/screens/wizard_ai_generate.dart';
import 'package:optilife_app/features/workout/presentation/pages/workout_details.dart';

import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/onboarding/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/signin_screen.dart';
import '../../features/auth/presentation/pages/signup_screen.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String goal = '/goal';
  static const String availableTime = '/time';
  static const String training = '/training';
  static const String equipment = '/equipment';
  static const String budget = '/budget';
  static const String diet = '/diet';
  static const String food = '/food';
  static const String fitness = '/fitness';
  static const String kitchen = '/kitchen';
  static const Set<String> _publicRoutes = {splash, onboarding, signin, signup};
  static const String generate = '/generate';
  static const String profile = '/profile';
  static const String workout = '/workout';
  static const String plan = '/plan';
  static const String timer = '/timer';


  static final GoRouter router = GoRouter(
    initialLocation: splash,
    refreshListenable: GoRouterRefreshStream(
  FirebaseAuth.instance.authStateChanges(),
),
redirect: (context, state) async {
  final user = FirebaseAuth.instance.currentUser;
  final location = state.matchedLocation;

  
  if (user == null) {
    return _publicRoutes.contains(location) ? null : signin;
  }

  
  if (location == onboarding) {
    try {
      final profile = await ProfileRepository().fetch(user.uid);
      return profile?.onboardingCompleted == true ? home : goal;
    } catch (_) {
      return signin;
    }
  }
  return null;
},
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(path: signin, builder: (context, state) => const SignInScreen()),
      GoRoute(path: signup, builder: (context, state) => const SignupScreen()),
      // GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(path: home, builder: (context, state) => const MainScreen()),
      GoRoute(path: goal, builder: (context, state) => const GoalsScreen()),
      GoRoute(
        path: availableTime,
        builder: (context, state) => const AvailableTimeScreen(),
      ),
      GoRoute(path: training, builder: (context, state) => const TrainingEnv()),
      GoRoute(path: equipment, builder: (context, state) => const Equipment()),
      GoRoute(path: budget, builder: (context, state) => const Budget()),
      GoRoute(path: diet, builder: (context, state) => const Dietry()),
      GoRoute(
        path: food,
        builder: (context, state) => const FoodAvaialbility(),
      ),
      GoRoute(
        path: fitness,
        builder: (context, state) => const FitnessBaselinePage(),
      ),
      GoRoute(
        path: kitchen,
        builder: (context, state) => const FoodAvaialbility(),
      ),
      GoRoute(
        path: generate,
        builder: (context, state) => const WizardAiGenerate(),
      ),
      GoRoute(path: profile, builder: (context, state) => const ProfilePage()),
      GoRoute(
        path: workout,
        builder: (context, state) => const WorkoutDetailsPage(),
      ),
      GoRoute(path: plan, builder: (context, state) => const WhatCanDo()),
      GoRoute(path: timer, builder: (context, state) => ActiveWorkoutSession()),
    ],
  );
}
