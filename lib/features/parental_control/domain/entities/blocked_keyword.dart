class BlockedKeyword {
  final String keywordId;
  final String category;
  final String term;
  final String locale;
  final String matchType;
  final bool enabled;

  BlockedKeyword({
    required this.keywordId,
    required this.category,
    required this.term,
    required this.locale,
    required this.matchType,
    required this.enabled,
  });

  factory BlockedKeyword.fromJson(Map<String, dynamic> json) {
    return BlockedKeyword(
      keywordId: json['keywordId'] as String,
      category: json['category'] as String,
      term: json['term'] as String,
      locale: json['locale'] as String,
      matchType: json['matchType'] as String,
      enabled: json['enabled'] as bool,
    );
  }
}
