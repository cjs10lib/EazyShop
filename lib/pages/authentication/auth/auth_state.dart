import 'package:eazy_shop/models/auth_user.dart';
import 'package:meta/meta.dart';

class AuthState {
  final bool isInitializing;
  final bool isAuthenticated;
  final bool isLoading;

  const AuthState({
    @required this.isInitializing,
    @required this.isAuthenticated,
    @required this.isLoading,
  });

  factory AuthState.initializing() {
    return AuthState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
    );
  }

  // factory AuthState.loading() {
  //   return AuthState(
  //     isInitializing: false,
  //     isAuthenticated: false,
  //     isLoading: true,
  //   );
  // }

  factory AuthState.authenticated() {
    return AuthState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
    );
  }

  factory AuthState.unauthenticated() {
    return AuthState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
    );
  }

  AuthState copyWith(
      {bool isInitializing, bool isAuthenticated, bool isLoading}) {
    return AuthState(
        isInitializing: isInitializing ?? this.isInitializing,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        isLoading: isLoading ?? this.isLoading);
  }
}
