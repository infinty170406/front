enum DeviceStatus { ONLINE, OFFLINE }

class Child {
  final String childId;
  final String displayName;
  final int age;
  final DeviceStatus deviceStatus;
  final DateTime lastSeenAt;

  Child({
    required this.childId,
    required this.displayName,
    required this.age,
    required this.deviceStatus,
    required this.lastSeenAt,
  });

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      childId: json['childId'] as String,
      displayName: json['displayName'] as String,
      age: json['age'] as int,
      deviceStatus: json['deviceStatus'] == 'ONLINE'
          ? DeviceStatus.ONLINE
          : DeviceStatus.OFFLINE,
      lastSeenAt: DateTime.parse(json['lastSeenAt'] as String),
    );
  }
}
