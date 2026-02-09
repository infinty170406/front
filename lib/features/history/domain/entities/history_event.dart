import 'dart:convert';

class HistoryEvent {
  final String eventId;
  final String type;
  final String actor;
  final DateTime occurredAt;
  final Map<String, dynamic> payload;

  HistoryEvent({
    required this.eventId,
    required this.type,
    required this.actor,
    required this.occurredAt,
    required this.payload,
  });

  factory HistoryEvent.fromJson(Map<String, dynamic> json) {
    return HistoryEvent(
      eventId: json['eventId'] as String,
      type: json['type'] as String,
      actor: json['actor'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      payload: json['payloadJson'] != null
          ? jsonDecode(json['payloadJson'] as String) as Map<String, dynamic>
          : {},
    );
  }

  String get readableMessage {
    switch (type) {
      case 'CONTENT_BLOCKED':
        return 'Accès bloqué à ${payload['url'] ?? 'un site'}';
      case 'APP_BLOCKED':
        return 'Application ${payload['appName'] ?? ''} bloquée';
      case 'SCHEDULE_ACTIVE':
        return 'Temps d\'écran terminé';
      default:
        return 'Événement détecté: $type';
    }
  }
}
