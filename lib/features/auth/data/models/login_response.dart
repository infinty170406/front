class LoginResponse {
  final String accessToken;
  final String tokenType;
  final int expiresInSeconds;
  final ParentData parent;

  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresInSeconds,
    required this.parent,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresInSeconds: json['expiresInSeconds'] as int,
      parent: ParentData.fromJson(json['parent'] as Map<String, dynamic>),
    );
  }
}

class ParentData {
  final String parentId;
  final String name;
  final String email;

  ParentData({
    required this.parentId,
    required this.name,
    required this.email,
  });

  factory ParentData.fromJson(Map<String, dynamic> json) {
    return ParentData(
      parentId: json['parentId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
