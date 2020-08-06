import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/presentation/login/auth_button.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/logger.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Stockton",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(40.0),
              child: _LoginForm(),
            ),
            PrivacySettingsButton(),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _memberTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    _memberTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final submitCallback = () {
      if (_formKey.currentState.validate()) {
        final loginAction = LogIn(
          email: _memberTextEditingController.text,
          password: _passwordTextEditingController.text,
        );

        StoreProvider.of<AppState>(context).dispatch(loginAction);
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Logging you in...")));

        loginAction.completer.future.catchError((error) {
          Scaffold.of(context).hideCurrentSnackBar();
          Logger.w(error.code.toString());
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(StocktonLocalizations.of(context)
                .authErrorMessage(error.code.toString())),
          ));
        });
      }
    };

    final submitButton = AuthButton(
      buttonText: "Login",
      onPressedCallback: submitCallback,
    );

    final _memberTextField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: "Email"),
      controller: _memberTextEditingController,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your email";
        }
        return null;
      },
    );

    final _passwordTextField = TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordTextEditingController,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter your password";
        }
        return null;
      },
      obscureText: true,
    );

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[_memberTextField, _passwordTextField, submitButton],
      ),
    );
  }
}
