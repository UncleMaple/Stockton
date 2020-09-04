import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/colors.dart';
import 'package:stockton/util/config.dart';
import 'package:stockton/util/logger.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 1250);

  Future<String> _loginUser(LoginData data, BuildContext context) async {
    String message;
    final loginAction = LogIn(
      account: data.name,
      password: data.password,
    );

    StoreProvider.of<AppState>(context).dispatch(loginAction);

    message = await loginAction.completer.future.catchError((e) {
      return StocktonLocalizations.of(context)
          .authErrorMessage(e?.message ?? "");
    });

    Logger.d("message: $message");
    return message;
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  var _loginTheme = LoginTheme(
    primaryColor: primaryBlack[900],
    accentColor: AppTheme.theme.accentColor,
    errorColor: Colors.orangeAccent,
    titleStyle: TextStyle(
      color: AppTheme.theme.accentColor,
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
    textFieldStyle: TextStyle(
      color: primaryBlack,
    ),
    buttonStyle: TextStyle(
      fontWeight: FontWeight.w800,
      color: AppTheme.theme.accentColor,
    ),
    cardTheme: CardTheme(
      color: AppTheme.theme.accentColor,
      elevation: 5.0,
      margin: EdgeInsets.only(top: 15),
    ),
    inputTheme: InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.zero,
      errorStyle: TextStyle(
        backgroundColor: primaryBlack[400],
        color: Colors.orangeAccent,
      ),
      labelStyle: TextStyle(
        fontSize: 12,
        color: primaryBlack[300],
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent, width: 1),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
    ),
    buttonTheme: LoginButtonTheme(
      splashColor: Colors.black26,
      backgroundColor: primaryBlack[300],
      highlightColor: primaryBlack[400],
    ),
  );

  var _messages = LoginMessages(
    usernameHint: "Phone/Email",
  );

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Config.appName,
//      logo: 'assets/images/tcorp.png',
      logo: 'packages/flutter_login/assets/images/ecorp.png',
      logoTag: Config.logoTag,
      titleTag: Config.titleTag,
      theme: _loginTheme,
      messages: _messages,
      emailValidator: (value) {
        if (value.isEmpty) {
          return 'Account is empty';
        }
        // 手机号
        if (int.tryParse(value) is int) {
          RegExp exp = RegExp(
              r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
          bool matched = exp.hasMatch(value);
          if (!matched) {
            return "Wrong phone number";
          }
          return null;
        }

        // 邮箱
        if (!value.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        return _loginUser(loginData, context);
      },
      onSignup: (loginData) {
        return _loginUser(loginData, context);
      },
      onSubmitAnimationCompleted: () {
        Navigator.pushNamed(context, Routes.home);
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
      },
    );
  }
}
