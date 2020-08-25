import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/presentation/login/auth_button.dart';
import 'package:stockton/presentation/settings/privacy_settings_button.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/colors.dart';
import 'package:stockton/util/config.dart';
import 'package:stockton/util/logger.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';

//class LoginScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
//        centerTitle: true,
//        title: Text(
//          "Stockton",
//          style: TextStyle(color: Colors.black),
//        ),
//      ),
//      body: Container(
//        child: Column(
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.all(40.0),
//              child: _LoginForm(),
//            ),
//            PrivacySettingsButton(),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class _LoginForm extends StatefulWidget {
//  @override
//  _LoginFormState createState() => _LoginFormState();
//}
//
//class _LoginFormState extends State<_LoginForm> {
//  final _formKey = GlobalKey<FormState>();
//  final _memberTextEditingController = TextEditingController();
//  final _passwordTextEditingController = TextEditingController();
//
//  @override
//  void dispose() {
//    _memberTextEditingController.dispose();
//    _passwordTextEditingController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final submitCallback = () {
//      if (_formKey.currentState.validate()) {
//        final loginAction = LogIn(
//          account: _memberTextEditingController.text,
//          password: _passwordTextEditingController.text,
//        );
//
//        StoreProvider.of<AppState>(context).dispatch(loginAction);
//        Scaffold.of(context)
//            .showSnackBar(SnackBar(content: Text("Logging you in...")));
//
//        loginAction.completer.future.catchError((error) {
//          Scaffold.of(context).hideCurrentSnackBar();
//          Logger.w(error.code.toString());
//          Scaffold.of(context).showSnackBar(SnackBar(
//            content: Text(StocktonLocalizations.of(context)
//                .authErrorMessage(error.code.toString())),
//          ));
//        });
//      }
//    };
//
//    final submitButton = AuthButton(
//      buttonText: "Login",
//      onPressedCallback: submitCallback,
//    );
//
//    final _memberTextField = TextFormField(
//      keyboardType: TextInputType.emailAddress,
//      decoration: const InputDecoration(labelText: "Email"),
//      controller: _memberTextEditingController,
//      validator: (value) {
//        if (value.isEmpty) {
//          return "Please enter your email";
//        }
//        return null;
//      },
//    );
//
//    final _passwordTextField = TextFormField(
//      decoration: const InputDecoration(labelText: "Password"),
//      controller: _passwordTextEditingController,
//      validator: (value) {
//        if (value.isEmpty) {
//          return "Please enter your password";
//        }
//        return null;
//      },
//      obscureText: true,
//    );
//
//    return Form(
//      key: _formKey,
//      child: Column(
//        children: <Widget>[_memberTextField, _passwordTextField, submitButton],
//      ),
//    );
//  }
//}


class LoginScreen extends StatelessWidget {

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 1250);

  Future<String> _loginUser(LoginData data, BuildContext context) {
    return Future.delayed(loginTime).then((_) async {
      String message;
      final loginAction = LogIn(
        account: data.name,
        password: data.password,
      );

      StoreProvider.of<AppState>(context).dispatch(loginAction);

      message = await loginAction.completer.future.catchError((e) {
        Logger.w("login screen: ${e.message}");
        return StocktonLocalizations.of(context).authErrorMessage(e.message);
      });

      Logger.d("message: $message");
      return message;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {

      return null;
    });
  }

  @override
  Widget build(BuildContext context) {

    return FlutterLogin(
      title: Config.appName,
//      logo: 'assets/images/tcorp.png',
      logo: 'packages/flutter_login/assets/images/ecorp.png',
      logoTag: Config.logoTag,
      titleTag: Config.titleTag,
      theme: LoginTheme(
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
          )),
      emailValidator: (value) {
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
