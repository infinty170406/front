import '../../../../core/network/api_config.dart';
import '../../../../core/network/api_service.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';

class AuthRepository {
  final ApiService _apiService;

  AuthRepository(this._apiService);

  Future<Map<String, dynamic>> register(RegisterRequest request) async {
    final response =
        await _apiService.post(ApiConfig.register, data: request.toJson());
    return response.data;
  }

  Future<Map<String, dynamic>> verifyOtp(String email, String otpCode) async {
    final response = await _apiService.post(ApiConfig.verifyOtp, data: {
      'email': email,
      'otpCode': otpCode,
    });
    return response.data;
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final response =
        await _apiService.post(ApiConfig.login, data: request.toJson());
    final loginResponse = LoginResponse.fromJson(response.data);
    await _apiService.saveToken(loginResponse.accessToken);
    return loginResponse;
  }

  Future<void> logout() async {
    await _apiService.clearToken();
  }

  Future<bool> isLoggedIn() async {
    final token = await _apiService.getToken();
    return token != null;
  }
}
