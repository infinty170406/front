# Screens Documentation

## Complete List of All 29 Screens

This document provides a comprehensive list of all converted screens, their file names, class names, and navigation routes.

---

## 📱 Screens by Category

### 1. Onboarding & Welcome (3 screens)

#### Splash Screen
- **File**: `splash_screen_screen.dart`
- **Class**: `SplashScreenScreen`
- **Route**: `AppRoutes.splashScreen` → `/splash_screen`
- **Description**: Initial loading screen with app logo and branding

#### Onboarding: Understand
- **File**: `onboarding__understand_screen.dart`
- **Class**: `OnboardingUnderstandScreen`
- **Route**: `AppRoutes.onboardingUnderstand` → `/onboarding_understand`
- **Description**: First onboarding step - explaining monitoring features

#### Onboarding: Control
- **File**: `onboarding__control_screen.dart`
- **Class**: `OnboardingControlScreen`
- **Route**: `AppRoutes.onboardingControl` → `/onboarding_control`
- **Description**: Second onboarding step - explaining control features

---

### 2. Authentication & Account (2 screens)

#### Create Parent Account
- **File**: `create_parent_account_screen.dart`
- **Class**: `CreateParentAccountScreen`
- **Route**: `AppRoutes.createParentAccount` → `/create_parent_account`
- **Description**: Registration form for parent users

#### Parental PIN Lock
- **File**: `parental_pin_lock_screen.dart`
- **Class**: `ParentalPinLockScreen`
- **Route**: `AppRoutes.parentalPinLock` → `/parental_pin_lock`
- **Description**: PIN code setup and verification

---

### 3. Profile Management (3 screens)

#### Create Child Profile
- **File**: `create_child_profile_screen.dart`
- **Class**: `CreateChildProfileScreen`
- **Route**: `AppRoutes.createChildProfile` → `/create_child_profile`
- **Description**: Form to add a new child profile

#### Child Profile Details
- **File**: `child_profile_details_screen.dart`
- **Class**: `ChildProfileDetailsScreen`
- **Route**: `AppRoutes.childProfileDetails` → `/child_profile_details`
- **Description**: Detailed view of a child's profile and settings

#### Link Child Device
- **File**: `link_child_device_screen.dart`
- **Class**: `LinkChildDeviceScreen`
- **Route**: `AppRoutes.linkChildDevice` → `/link_child_device`
- **Description**: Process to connect a child's device

---

### 4. Dashboard & Overview (2 screens)

#### Multi-Child Dashboard
- **File**: `multi_child_dashboard_screen.dart`
- **Class**: `MultiChildDashboardScreen`
- **Route**: `AppRoutes.multiChildDashboard` → `/multi_child_dashboard`
- **Description**: Main dashboard showing all children's activities

#### Weekly Activity Report
- **File**: `weekly_activity_report_screen.dart`
- **Class**: `WeeklyActivityReportScreen`
- **Route**: `AppRoutes.weeklyActivityReport` → `/weekly_activity_report`
- **Description**: Comprehensive weekly summary of activities

---

### 5. Activity Monitoring (2 screens)

#### Advanced Activity Analytics
- **File**: `advanced_activity_analytics_screen.dart`
- **Class**: `AdvancedActivityAnalyticsScreen`
- **Route**: `AppRoutes.advancedActivityAnalytics` → `/advanced_activity_analytics`
- **Description**: Detailed analytics with charts and graphs

#### Screen Time Request
- **File**: `screen_time_request_screen.dart`
- **Class**: `ScreenTimeRequestScreen`
- **Route**: `AppRoutes.screenTimeRequest` → `/screen_time_request`
- **Description**: Child's request for additional screen time

---

### 6. Rules & Configuration (4 screens)

#### Configure Simple Rules
- **File**: `configure_simple_rules_screen.dart`
- **Class**: `ConfigureSimpleRulesScreen`
- **Route**: `AppRoutes.configureSimpleRules` → `/configure_simple_rules`
- **Description**: Quick setup for basic parental controls

#### Strict Mode Configuration
- **File**: `strict_mode_configuration_screen.dart`
- **Class**: `StrictModeConfigurationScreen`
- **Route**: `AppRoutes.strictModeConfiguration` → `/strict_mode_configuration`
- **Description**: Enhanced protection settings

#### Content Filtering Rules
- **File**: `content_filtering_rules_screen.dart`
- **Class**: `ContentFilteringRulesScreen`
- **Route**: `AppRoutes.contentFilteringRules` → `/content_filtering_rules`
- **Description**: Website and content filtering settings

#### Child Request Approval
- **File**: `child_request_approval_screen.dart`
- **Class**: `ChildRequestApprovalScreen`
- **Route**: `AppRoutes.childRequestApproval` → `/child_request_approval`
- **Description**: Review and approve/deny child requests

---

### 7. Location Features (6 screens)

#### Child Real-time Location
- **File**: `child_real_time_location_screen.dart`
- **Class**: `ChildRealTimeLocationScreen`
- **Route**: `AppRoutes.childRealTimeLocation` → `/child_real_time_location`
- **Description**: Live GPS tracking on map

#### Location History Timeline
- **File**: `location_history_timeline_screen.dart`
- **Class**: `LocationHistoryTimelineScreen`
- **Route**: `AppRoutes.locationHistoryTimeline` → `/location_history_timeline`
- **Description**: Historical location records

#### Safe Zones Management
- **File**: `safe_zones_management_screen.dart`
- **Class**: `SafeZonesManagementScreen`
- **Route**: `AppRoutes.safeZonesManagement` → `/safe_zones_management`
- **Description**: List and manage all safe zones

#### Create New Safe Zone
- **File**: `create_new_safe_zone_screen.dart`
- **Class**: `CreateNewSafeZoneScreen`
- **Route**: `AppRoutes.createNewSafeZone` → `/create_new_safe_zone`
- **Description**: Add a new safe zone on map

#### Safe Zone Alert
- **File**: `safe_zone_alert_screen.dart`
- **Class**: `SafeZoneAlertScreen`
- **Route**: `AppRoutes.safeZoneAlert` → `/safe_zone_alert`
- **Description**: Notification when child enters/exits zone

#### Exit Zone Alert Detail
- **File**: `exit_zone_alert_detail_screen.dart`
- **Class**: `ExitZoneAlertDetailScreen`
- **Route**: `AppRoutes.exitZoneAlertDetail` → `/exit_zone_alert_detail`
- **Description**: Detailed information about zone exit

---

### 8. AI Features (3 screens)

#### AI Assistant Guide
- **File**: `ai_assistant_guide_screen.dart`
- **Class**: `AiAssistantGuideScreen`
- **Route**: `AppRoutes.aiAssistantGuide` → `/ai_assistant_guide`
- **Description**: Introduction to AI-powered features

#### AI Smart Recommendation
- **File**: `ai_smart_recommendation_screen.dart`
- **Class**: `AiSmartRecommendationScreen`
- **Route**: `AppRoutes.aiSmartRecommendation` → `/ai_smart_recommendation`
- **Description**: AI-generated parenting suggestions

#### AI Safety Suggestions
- **File**: `ai_safety_suggestions_screen.dart`
- **Class**: `AiSafetySuggestionsScreen`
- **Route**: `AppRoutes.aiSafetySuggestions` → `/ai_safety_suggestions`
- **Description**: Proactive safety recommendations

---

### 9. Device Management (2 screens)

#### Connected Devices Hub
- **File**: `connected_devices_hub_screen.dart`
- **Class**: `ConnectedDevicesHubScreen`
- **Route**: `AppRoutes.connectedDevicesHub` → `/connected_devices_hub`
- **Description**: Manage all connected devices

#### Smart TV Control (Coming Soon)
- **File**: `smart_tv_control_coming_soon_screen.dart`
- **Class**: `SmartTvControlComingSoonScreen`
- **Route**: `AppRoutes.smartTvControlComingSoon` → `/smart_tv_control_coming_soon`
- **Description**: Upcoming TV monitoring feature preview

---

### 10. Settings & Notifications (2 screens)

#### Parent App Settings
- **File**: `parent_app_settings_screen.dart`
- **Class**: `ParentAppSettingsScreen`
- **Route**: `AppRoutes.parentAppSettings` → `/parent_app_settings`
- **Description**: App configuration and preferences

#### Lock Screen Safety Notification
- **File**: `lock_screen_safety_notification_screen.dart`
- **Class**: `LockScreenSafetyNotificationScreen`
- **Route**: `AppRoutes.lockScreenSafetyNotification` → `/lock_screen_safety_notification`
- **Description**: System-level notification display

---

## 🧭 Navigation Examples

### Basic Navigation
```dart
// Navigate to a screen
Navigator.pushNamed(context, AppRoutes.splashScreen);

// Navigate and replace
Navigator.pushReplacementNamed(context, AppRoutes.multiChildDashboard);

// Navigate with data
Navigator.pushNamed(
  context, 
  AppRoutes.childProfileDetails,
  arguments: {'childId': '123'},
);
```

### Navigation with Routes.dart
```dart
// Using the routes map
onPressed: () {
  Navigator.pushNamed(context, AppRoutes.createChildProfile);
}

// Using generateRoute
onPressed: () {
  Navigator.push(
    context,
    AppRoutes.generateRoute(
      RouteSettings(name: AppRoutes.childRealTimeLocation),
    ),
  );
}
```

---

## 📊 Screen Statistics

- **Total Screens**: 29
- **Onboarding**: 3 screens
- **Authentication**: 2 screens
- **Profiles**: 3 screens
- **Dashboards**: 2 screens
- **Monitoring**: 2 screens
- **Rules**: 4 screens
- **Location**: 6 screens
- **AI Features**: 3 screens
- **Device Management**: 2 screens
- **Settings**: 2 screens

---

## 🎯 Implementation Status

### ✅ Completed
- All 29 screen files generated
- Basic widget structure
- Theme integration
- Route definitions
- Material Design 3 compliance

### 🚧 To Be Implemented
- Detailed UI matching original HTML
- Form validation
- State management integration
- API connections
- Real functionality
- Image assets
- Animations
- Responsive improvements

---

## 💡 Usage Tips

1. **Start with Splash Screen**: Begin user flow from `AppRoutes.splashScreen`
2. **Onboarding Flow**: Splash → Onboarding Understand → Onboarding Control → Create Account
3. **Main Flow**: Create Account → Create Child Profile → Multi-Child Dashboard
4. **Child Management**: Dashboard → Child Profile Details → Various controls
5. **Location Features**: Dashboard → Location screens → Safe Zones

---

## 🔄 Update History

- **Initial Conversion**: All 29 screens converted from HTML to Flutter
- **Current Version**: 1.0.0
- **Last Updated**: February 2026

---

*This documentation is auto-generated based on the HTML-to-Flutter conversion process.*
