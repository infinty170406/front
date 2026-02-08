import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  AuthState({
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(AuthState());

  Future<bool> signUp(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    await Future.delayed(const Duration(seconds: 2)); // Mock API delay

    if (email.contains('@')) {
      state = state.copyWith(isLoading: false, isAuthenticated: true);
      return true;
    } else {
      state = state.copyWith(isLoading: false, error: "Invalid email address");
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    await Future.delayed(const Duration(seconds: 2)); // Mock API delay

    // Always succeed for mock, unless empty
    if (email.isNotEmpty && password.isNotEmpty) {
      state = state.copyWith(isLoading: false, isAuthenticated: true);
      return true;
    } else {
      state = state.copyWith(isLoading: false, error: "Invalid credentials");
      return false;
    }
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});
