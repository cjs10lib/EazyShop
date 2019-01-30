import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eazy_shop/pages/authentication/auth/auth_event.dart';
import 'package:eazy_shop/pages/authentication/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthState.initializing();

  @override
  Stream<AuthState> mapEventToState(AuthState currentState, AuthEvent event) async* {
    
  }

}