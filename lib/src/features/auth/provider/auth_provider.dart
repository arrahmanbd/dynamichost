import 'package:flutter_riverpod/legacy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginState {
  final bool rememberMe;
  final bool isLoading;

  const LoginState({
    this.rememberMe = false,
    this.isLoading = false,
  });

  LoginState copyWith({
    bool? rememberMe,
    bool? isLoading,
  }) {
    return LoginState(
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(const LoginState());

  void toggleRemember(bool value) {
    state = state.copyWith(rememberMe: value);
  }

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(isLoading: false);
  }
}

final loginProvider =
    StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);