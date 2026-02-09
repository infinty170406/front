import 'package:flutter/material.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/auth/presentation/screens/otp_verification_screen.dart';
import 'features/dashboard/presentation/screens/children_list_screen.dart';
import 'features/dashboard/presentation/screens/child_dashboard_screen.dart';
import 'features/dashboard/presentation/screens/link_child_screen.dart';
import 'features/history/presentation/screens/activity_logs_screen.dart';
import 'features/parental_control/presentation/screens/schedule_manager_screen.dart';
import 'features/onboarding/presentation/screens/splash_screen_screen.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String dashboard = '/dashboard';
  static const String linkChild = '/link-child';
  static const String childDashboard = '/child-dashboard';
  static const String activityLogs = '/activity-logs';
  static const String schedules = '/schedules';
  static const String verifyOtp = '/verify-otp';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreenScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const ChildrenListScreen());
      case linkChild:
        return MaterialPageRoute(builder: (_) => const LinkChildScreen());
      case childDashboard:
        final childId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ChildDashboardScreen(childId: childId));
      case activityLogs:
        final childId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ActivityLogsScreen(childId: childId));
      case schedules:
        final childId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ScheduleManagerScreen(childId: childId));
      case verifyOtp:
        final email = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => OtpVerificationScreen(email: email));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
