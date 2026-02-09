import 'schedule_rule.dart';

class ContentRule {
  final String ruleId;
  final String category;
  final RuleAction action;
  final double confidenceThreshold;
  final bool enabled;

  ContentRule({
    required this.ruleId,
    required this.category,
    required this.action,
    required this.confidenceThreshold,
    required this.enabled,
  });

  factory ContentRule.fromJson(Map<String, dynamic> json) {
    return ContentRule(
      ruleId: json['ruleId'] as String,
      category: json['category'] as String,
      action: RuleAction.values.byName(json['action'] as String),
      confidenceThreshold: (json['confidenceThreshold'] as num).toDouble(),
      enabled: json['enabled'] as bool,
    );
  }
}
