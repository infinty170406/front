class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String? phoneNumber;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
    };
  }
}
