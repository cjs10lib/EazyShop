import 'dart:async';

import 'package:eazy_shop/models/auth_user.dart';
import 'package:eazy_shop/models/timeout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Future<FirebaseUser> currentUser() {
  //   return _auth.currentUser()

  //   .timeout(const Duration(seconds: 30),
  //       onTimeout: () {
  //     final timeoutError = TimeoutErrorMessage(
  //         message:
  //             'Slow internet connection detected! Operation has timed out');

  //     throw (timeoutError);
  //   }).catchError((error) {
  //     throw (error.message);
  //   });
  // }

  Future<AuthUser> currentUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return AuthUser(
        uid: preferences.getString('uid'),
        email: preferences.getString('email'));
  }

  Future<void> persistUser({@required AuthUser user}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('uid', user.uid);
    preferences.setString('email', user.email);
  }

  Future<void> deleteUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('uid');
    preferences.remove('email');
  }
}
