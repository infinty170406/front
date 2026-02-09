import 'dart:io';

class ApiConfig {
  /// URL de base de l'API
  static String get baseUrl {
    // Détection automatique pour Android Emulator
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8080';
    }
    return 'http://localhost:8080';
  }

  // ==================== AUTH ====================
  static const String login = '/api/v1/auth/login';
  static const String register = '/api/v1/auth/register';
  static const String verifyOtp = '/api/v1/auth/verify-otp';

  // ==================== PARENT ====================
  static const String myChildren = '/api/v1/parents/me/children';
  static const String linkChild = '/api/v1/parents/me/children/link';

  // ==================== PARENTAL CONTROL ====================
  static String parentalProfile(String childId) =>
      '/api/v1/children/$childId/parental/profile';

  static String schedules(String childId) =>
      '/api/v1/children/$childId/parental/schedules';

  static String schedule(String childId, String scheduleId) =>
      '/api/v1/children/$childId/parental/schedules/$scheduleId';

  static String contentRule(String childId, String category) =>
      '/api/v1/children/$childId/parental/content/$category';

  static String contentKeywords(String childId, String category) =>
      '/api/v1/children/$childId/parental/content/$category/keywords';

  // ==================== HISTORY ====================
  static String history(String childId) => '/api/v1/children/$childId/history';

  // ==================== DEVICE ====================
  static String deviceRules(String childId) =>
      '/api/v1/device/children/$childId/rules';

  static String deviceEvents(String childId) =>
      '/api/v1/device/children/$childId/events';

  // ==================== EXECUTE ====================
  static const String execute = '/api/v1/execute';
}
