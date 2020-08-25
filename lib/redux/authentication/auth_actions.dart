import 'package:stockton/models/member.dart';
import 'dart:async';
import 'package:meta/meta.dart';

// Authentication
class VerifyAuthenticationState {}

class LogIn {
  final String account;
  final String password;
  final Completer<String> completer;

  LogIn({this.account, this.password, Completer completer})
      : completer = completer ?? Completer();
}

@immutable
class OnAuthenticated {
  final Member member;

  OnAuthenticated(this.member);

//  const onAuthenticated({@required this.member}); // !!! 这个地方我改了

  @override
  String toString() {
    return "OnAuthenticated{member: $member}";
  }
}

class LogOutAction {}

class OnLogoutSuccess {
  OnLogoutSuccess();

  @override
  String toString() {
    return "LogOut{user: null}";
  }
}

class OnLogoutFail {
  final dynamic error;

  OnLogoutFail(this.error);

  @override
  String toString() {
    return "OnLogoutFail{There was an error in: $error}";
  }
}
