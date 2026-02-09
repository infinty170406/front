import 'blocked_keyword.dart';
import 'content_rule.dart';
import 'parental_profile.dart';
import 'schedule_rule.dart';

class ProfileAggregate {
  final String childId;
  final ParentalProfile profile;
  final List<ScheduleRule> scheduleRules;
  final List<ContentRule> contentRules;
  final List<BlockedKeyword> blockedKeywords;

  ProfileAggregate({
    required this.childId,
    required this.profile,
    required this.scheduleRules,
    required this.contentRules,
    required this.blockedKeywords,
  });

  factory ProfileAggregate.fromJson(Map<String, dynamic> json) {
    return ProfileAggregate(
      childId: json['childId'] as String,
      profile:
          ParentalProfile.fromJson(json['profile'] as Map<String, dynamic>),
      scheduleRules: (json['scheduleRules'] as List)
          .map((e) => ScheduleRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      contentRules: (json['contentRules'] as List)
          .map((e) => ContentRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      blockedKeywords: (json['blockedKeywords'] as List)
          .map((e) => BlockedKeyword.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
