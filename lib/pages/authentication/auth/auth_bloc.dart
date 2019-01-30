import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eazy_shop/models/auth_user.dart';
import 'package:eazy_shop/pages/authentication/auth/auth_event.dart';
import 'package:eazy_shop/pages/authentication/auth/auth_state.dart';
import 'package:eazy_shop/repositories/auth/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepository = AuthRepository();

  @override
  AuthState get initialState => AuthState.initializing();

  @override
  Stream<AuthState> mapEventToState(
      AuthState currentState, AuthEvent event) async* {
    if (event is AppStart) {
      final AuthUser user = await _authRepository.currentUser();

      if (user != null) {
        yield AuthState.authenticated();
      } else {
        yield AuthState.unauthenticated();
      }
    }

    if (event is Login) {
      yield currentState.copyWith(isLoading: true);

      await _authRepository.persistUser(user: event.user);
      yield AuthState.authenticated();
    }

    if (event is Logout) {
      yield currentState.copyWith(isLoading: true);

      await _authRepository.deleteUser();
      yield AuthState.unauthenticated();
    }
  }
}
