import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stockton/presentation/login/auth_button.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/stockton_localization.dart';

class AuthButtonContainer extends StatelessWidget {
  const AuthButtonContainer();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel viewModel) {
        return AuthButton(
          buttonText: viewModel.isLoggedIn
              ? StocktonLocalizations.of(context).logOut
              : StocktonLocalizations.of(context).logIn,
          onPressedCallback: viewModel.onPressedCallback,
        );
      },
    );
  }
}

class _ViewModel {
  final bool isLoggedIn;
  final Function onPressedCallback;

  _ViewModel(this.isLoggedIn, this.onPressedCallback);

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(store.state.member != null, () {
      if (store.state.member != null) {
        store.dispatch(LogOutAction());
      } else {
        store.dispatch(LogIn());
      }
    });
  }
}
