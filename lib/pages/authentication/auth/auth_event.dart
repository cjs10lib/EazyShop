import 'package:eazy_shop/models/auth_user.dart';
import 'package:meta/meta.dart';

abstract class AuthEvent {}

class AppStart extends AuthEvent {}

class Login extends AuthEvent {
  final AuthUser user;

  Login({@required this.user});
}

class Logout extends AuthEvent {}
