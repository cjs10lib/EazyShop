import 'dart:async';

import 'package:eazy_shop/models/auth_user.dart';
import 'package:eazy_shop/services/auth/auth_service.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final _authService = AuthService();

  Future<AuthUser> currentUser() async {
    try {
      return await _authService.currentUser();
    } catch (error) {
      throw error.toString();
    }
  }

  Future<void> persistUser({@required AuthUser user}) async {
    try {
      return await _authService.persistUser(user: user);
    } catch (error) {
      throw error.toString();
    }
  }

  Future<void> deleteUser() async {
    try {
      return await _authService.deleteUser();
    } catch (error) {
      throw error.toString();
    }
  }
}
