import 'package:flutter/material.dart';
import 'features/onboarding/presentation/screens/splash_screen_screen.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';
import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/ai_setup/presentation/screens/ai_welcome_screen.dart';
import 'features/ai_setup/presentation/screens/child_creation_screen.dart';
import 'features/ai_setup/presentation/screens/ai_configuration_wizard_screen.dart';
import 'features/dashboard/presentation/screens/dashboard_screen.dart';
import 'features/child_device/presentation/screens/installation_screen.dart';
// Legacy imports (some might be unused now but keeping for safety of unrefactored routes)

import 'features/legacy_screens/child_profile_details_screen.dart';
import 'features/legacy_screens/weekly_activity_report_screen.dart';
import 'features/legacy_screens/strict_mode_configuration_screen.dart';
import 'features/legacy_screens/ai_smart_recommendation_screen.dart';
import 'features/legacy_screens/content_filtering_rules_screen.dart';
import 'features/legacy_screens/child_request_approval_screen.dart';
import 'features/legacy_screens/parent_app_settings_screen.dart';
import 'features/legacy_screens/screen_time_request_screen.dart';
import 'features/legacy_screens/parental_pin_lock_screen.dart';
import 'features/legacy_screens/child_real_time_location_screen.dart';
import 'features/legacy_screens/location_history_timeline_screen.dart';
import 'features/legacy_screens/safe_zones_management_screen.dart';
import 'features/legacy_screens/create_new_safe_zone_screen.dart';
import 'features/legacy_screens/safe_zone_alert_screen.dart';
import 'features/legacy_screens/connected_devices_hub_screen.dart';
import 'features/legacy_screens/smart_tv_control_coming_soon_screen.dart';
import 'features/legacy_screens/advanced_activity_analytics_screen.dart';
import 'features/legacy_screens/ai_safety_suggestions_screen.dart';
import 'features/legacy_screens/lock_screen_safety_notification_screen.dart';
import 'features/legacy_screens/exit_zone_alert_detail_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String onboarding = '/onboarding';
  static const String createParentAccount = '/create_parent_account';
  static const String login = '/login';
  static const String aiAssistantGuide = '/ai_assistant_guide';
  static const String createChildProfile = '/create_child_profile';
  static const String aiConfigurationWizard = '/ai_configuration_wizard';
  static const String multiChildDashboard = '/multi_child_dashboard';

  static const String linkChildDevice = '/link_child_device';
  static const String childProfileDetails = '/child_profile_details';
  static const String weeklyActivityReport = '/weekly_activity_report';
  static const String strictModeConfiguration = '/strict_mode_configuration';
  static const String aiSmartRecommendation = '/ai_smart_recommendation';
  static const String contentFilteringRules = '/content_filtering_rules';
  static const String childRequestApproval = '/child_request_approval';
  static const String parentAppSettings = '/parent_app_settings';
  static const String screenTimeRequest = '/screen_time_request';
  static const String parentalPinLock = '/parental_pin_lock';
  static const String childRealTimeLocation = '/child_real_time_location';
  static const String locationHistoryTimeline = '/location_history_timeline';
  static const String safeZonesManagement = '/safe_zones_management';
  static const String createNewSafeZone = '/create_new_safe_zone';
  static const String safeZoneAlert = '/safe_zone_alert';
  static const String connectedDevicesHub = '/connected_devices_hub';
  static const String smartTvControlComingSoon =
      '/smart_tv_control_coming_soon';
  static const String advancedActivityAnalytics =
      '/advanced_activity_analytics';
  static const String aiSafetySuggestions = '/ai_safety_suggestions';
  static const String lockScreenSafetyNotification =
      '/lock_screen_safety_notification';
  static const String exitZoneAlertDetail = '/exit_zone_alert_detail';

  // Routes map
  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (context) => const SplashScreenScreen(),
        onboarding: (context) => const OnboardingScreen(),
        createParentAccount: (context) => const SignUpScreen(),
        login: (context) => const LoginScreen(),
        aiAssistantGuide: (context) => const AiWelcomeScreen(),
        createChildProfile: (context) => const ChildCreationScreen(),
        aiConfigurationWizard: (context) => const AiConfigurationWizardScreen(),
        multiChildDashboard: (context) => const MultiChildDashboardScreen(),
        linkChildDevice: (context) => const InstallationScreen(),
        childProfileDetails: (context) => const ChildProfileDetailsScreen(),
        weeklyActivityReport: (context) => const WeeklyActivityReportScreen(),
        strictModeConfiguration: (context) =>
            const StrictModeConfigurationScreen(),
        aiSmartRecommendation: (context) => const AiSmartRecommendationScreen(),
        contentFilteringRules: (context) => const ContentFilteringRulesScreen(),
        childRequestApproval: (context) => const ChildRequestApprovalScreen(),
        parentAppSettings: (context) => const ParentAppSettingsScreen(),
        screenTimeRequest: (context) => const ScreenTimeRequestScreen(),
        parentalPinLock: (context) => const ParentalPinLockScreen(),
        childRealTimeLocation: (context) => const ChildRealTimeLocationScreen(),
        locationHistoryTimeline: (context) =>
            const LocationHistoryTimelineScreen(),
        safeZonesManagement: (context) => const SafeZonesManagementScreen(),
        createNewSafeZone: (context) => const CreateNewSafeZoneScreen(),
        safeZoneAlert: (context) => const SafeZoneAlertScreen(),
        connectedDevicesHub: (context) => const ConnectedDevicesHubScreen(),
        smartTvControlComingSoon: (context) =>
            const SmartTvControlComingSoonScreen(),
        advancedActivityAnalytics: (context) =>
            const AdvancedActivityAnalyticsScreen(),
        aiSafetySuggestions: (context) => const AiSafetySuggestionsScreen(),
        lockScreenSafetyNotification: (context) =>
            const LockScreenSafetyNotificationScreen(),
        exitZoneAlertDetail: (context) => const ExitZoneAlertDetailScreen(),
      };

  // Generate route method
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreenScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case createParentAccount:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case createChildProfile:
        return MaterialPageRoute(builder: (_) => const ChildCreationScreen());
      case multiChildDashboard:
        return MaterialPageRoute(
            builder: (_) => const MultiChildDashboardScreen());
      case childProfileDetails:
        return MaterialPageRoute(
            builder: (_) => const ChildProfileDetailsScreen());
      case parentAppSettings:
        return MaterialPageRoute(
            builder: (_) => const ParentAppSettingsScreen());
      case linkChildDevice:
        return MaterialPageRoute(builder: (_) => const InstallationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
