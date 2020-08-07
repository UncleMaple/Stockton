//import 'package:stockton/util/colors.dart';
//import 'package:stockton/util/constants.dart';
//import 'package:stockton/screens/home_screen.dart';
//import 'package:stockton/util/routes.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_login/flutter_login.dart';
//import 'package:stockton/models/users.dart';
//import 'package:stockton/util/theme.dart';
//
//class LoginScreen extends StatelessWidget {
////  static const routeName = '/auth';
//
//  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 1250);
//
//  Future<String> _loginUser(LoginData data) {
//    return Future.delayed(loginTime).then((_) {
//      if (!mockUsers.containsKey(data.name)) {
//        return 'Username not exists';
//      }
//
//      if (mockUsers[data.name] != data.password) {
//        return 'Password does not match';
//      }
//
//      return null;
//    });
//  }
//
//  Future<String> _recoverPassword(String name) {
//    return Future.delayed(loginTime).then((_) {
//      if (!mockUsers.containsKey(name)) {
//        return 'Username not exists';
//      }
//      return null;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    final inputBorder = BorderRadius.vertical(
////      bottom: Radius.circular(10.0),
////      top: Radius.circular(10.0),
////    );
//
//    return FlutterLogin(
//      title: Constants.appName,
////      logo: 'assets/images/tcorp.png',
//      logo: 'packages/flutter_login/assets/images/ecorp.png',
//      logoTag: Constants.logoTag,
//      titleTag: Constants.titleTag,
//      theme: LoginTheme(
//          primaryColor: primaryBlack[900],
//          accentColor: AppTheme.theme.accentColor,
//          errorColor: Colors.orangeAccent,
//          titleStyle: TextStyle(
//            color: AppTheme.theme.accentColor,
//            fontFamily: 'Quicksand',
//            fontWeight: FontWeight.bold,
//            letterSpacing: 2,
//          ),
//          textFieldStyle: TextStyle(
//            color: primaryBlack,
//          ),
//          buttonStyle: TextStyle(
//            fontWeight: FontWeight.w800,
//            color: AppTheme.theme.accentColor,
//          ),
//          cardTheme: CardTheme(
//            color: AppTheme.theme.accentColor,
//            elevation: 5.0,
//            margin: EdgeInsets.only(top: 15),
//          ),
//          inputTheme: InputDecorationTheme(
//            filled: true,
//            contentPadding: EdgeInsets.zero,
//            errorStyle: TextStyle(
//              backgroundColor: primaryBlack[400],
//              color: Colors.orangeAccent,
//            ),
//            labelStyle: TextStyle(
//              fontSize: 12,
//              color: primaryBlack[300],
//            ),
//            errorBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
//            ),
//            focusedErrorBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
//            ),
//            disabledBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: Colors.grey, width: 2),
//            ),
//          ),
//          buttonTheme: LoginButtonTheme(
//            splashColor: Colors.black26,
//            backgroundColor: primaryBlack[300],
//            highlightColor: primaryBlack[400],
//          )),
//      emailValidator: (value) {
//        if (!value.contains('@') || !value.endsWith('.com')) {
//          return "Email must contain '@' and end with '.com'";
//        }
//        return null;
//      },
//      passwordValidator: (value) {
//        if (value.isEmpty) {
//          return 'Password is empty';
//        }
//        return null;
//      },
//      onLogin: (loginData) {
//        return _loginUser(loginData);
//      },
//      onSignup: (loginData) {
//        return _loginUser(loginData);
//      },
//      onSubmitAnimationCompleted: () {
//        Navigator.pushNamed(context, Routes.home);
////        Navigator.push(
////          context,
////          MaterialPageRoute(
////            builder: (context) {
////              return Home();
////            },
////          ),
////        );
//      },
//      onRecoverPassword: (name) {
//        print('Recover password info');
//        print('Name: $name');
//        return _recoverPassword(name);
//      },
//    );
//  }
//}
