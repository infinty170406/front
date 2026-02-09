enum RuleAction { ALLOW, BLOCK, RESTRICT, WARN }

class ScheduleRule {
  final String scheduleId;
  final List<String> daysOfWeek;
  final String startTime;
  final String endTime;
  final RuleAction action;
  final bool enabled;

  ScheduleRule({
    required this.scheduleId,
    required this.daysOfWeek,
    required this.startTime,
    required this.endTime,
    required this.action,
    required this.enabled,
  });

  factory ScheduleRule.fromJson(Map<String, dynamic> json) {
    return ScheduleRule(
      scheduleId: json['scheduleId'] as String,
      daysOfWeek: List<String>.from(json['daysOfWeek']),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      action: RuleAction.values.byName(json['action'] as String),
      enabled: json['enabled'] as bool,
    );
  }
}
