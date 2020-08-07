import "package:redux/redux.dart";
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/push/push_actions.dart';

final pushReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, UpdateMemberTokenAction>(_updateUserAction),
  TypedReducer<AppState, ShowPushNotificationAction>(
      _showPushNotificationAction),
  TypedReducer<AppState, OnPushNotificationDismissedAction>(
      _onPushNotificationDismissed),
];

AppState _updateUserAction(AppState state, UpdateMemberTokenAction action) {
  return state.rebuild((s) => s..fcmToken = action.token);
}

AppState _showPushNotificationAction(
    AppState state, ShowPushNotificationAction action) {
  return state.rebuild(
          (s) => s..inAppNotification = action.inAppNotification.toBuilder());
}

AppState _onPushNotificationDismissed(
    AppState state,
    OnPushNotificationDismissedAction action,
    ) {
  return state.rebuild((s) => s..inAppNotification = null);
}
