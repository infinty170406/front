enum ProfileMode { STRICT, MODERATE, PERMISSIVE }

class ParentalProfile {
  final String profileId;
  final bool enabled;
  final ProfileMode mode;
  final String timezone;

  ParentalProfile({
    required this.profileId,
    required this.enabled,
    required this.mode,
    required this.timezone,
  });

  factory ParentalProfile.fromJson(Map<String, dynamic> json) {
    return ParentalProfile(
      profileId: json['profileId'] as String,
      enabled: json['enabled'] as bool,
      mode: ProfileMode.values.byName(json['mode'] as String),
      timezone: json['timezone'] as String,
    );
  }
}
