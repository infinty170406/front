import '../../../../core/network/api_config.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/entities/profile_aggregate.dart';
import '../../domain/entities/parental_profile.dart';
import '../../domain/entities/schedule_rule.dart';
import '../../domain/entities/content_rule.dart';

class ParentalControlRepository {
  final ApiService _apiService;

  ParentalControlRepository(this._apiService);

  Future<ProfileAggregate> getProfile(String childId) async {
    final response = await _apiService.get(ApiConfig.parentalProfile(childId));
    return ProfileAggregate.fromJson(response.data);
  }

  Future<ParentalProfile> updateProfile(String childId,
      {required bool enabled, required String mode}) async {
    final response =
        await _apiService.put(ApiConfig.parentalProfile(childId), data: {
      'enabled': enabled,
      'mode': mode,
    });
    return ParentalProfile.fromJson(response.data);
  }

  Future<ScheduleRule> createSchedule(
      String childId, Map<String, dynamic> data) async {
    final response =
        await _apiService.post(ApiConfig.schedules(childId), data: data);
    return ScheduleRule.fromJson(response.data);
  }

  Future<ScheduleRule> updateSchedule(
      String childId, String scheduleId, Map<String, dynamic> data) async {
    final response = await _apiService
        .put(ApiConfig.schedule(childId, scheduleId), data: data);
    return ScheduleRule.fromJson(response.data);
  }

  Future<void> deleteSchedule(String childId, String scheduleId) async {
    await _apiService.delete(ApiConfig.schedule(childId, scheduleId));
  }

  Future<ContentRule> updateContentRule(
      String childId, String category, Map<String, dynamic> data) async {
    final response = await _apiService
        .put(ApiConfig.contentRule(childId, category), data: data);
    return ContentRule.fromJson(response.data);
  }

  Future<void> updateKeywords(
      String childId, String category, List<String> keywords) async {
    await _apiService.put(ApiConfig.contentKeywords(childId, category), data: {
      'keywords': keywords,
      'locale': 'fr',
      'matchType': 'EXACT',
    });
  }
}
