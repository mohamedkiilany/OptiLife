import 'package:go_router/go_router.dart';
import 'package:optilife_app/features/progress/presentation/pages/available_time_screen.dart';
import 'package:optilife_app/features/progress/presentation/pages/goals_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/onboarding/presentation/pages/splash_screen.dart';
import '../../features/auth/presentation/pages/signin_screen.dart';
import '../../features/auth/presentation/pages/signup_screen.dart';
import '../../features/home/presentation/pages/home_page.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  // static const String wizard = '/wizard';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String goal = '/goal';
  static const String availableTime = '/time';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      GoRoute(path: signin, builder: (context, state) => const SignInScreen()),
      GoRoute(path: signup, builder: (context, state) => const SignupScreen()),
      GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(path: goal, builder: (context, state) => const GoalsScreen()),
      GoRoute(path: availableTime, builder: (context, state) => const AvailableTimeScreen()),
    ],
  );
}
