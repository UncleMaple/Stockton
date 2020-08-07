
import 'package:stockton/models/in_app_notification.dart';

class UpdateMemberTokenAction {
  final String token;

  UpdateMemberTokenAction(this.token);
}

class OnPushNotificationOpenAction {
  final Map<String, dynamic> message;

  OnPushNotificationOpenAction(this.message);
}

class OnPushNotificationReceivedAction {
  final Map<String, dynamic> message;

  OnPushNotificationReceivedAction(this.message);
}

class ShowPushNotificationAction {
  InAppNotification inAppNotification;

  ShowPushNotificationAction(this.inAppNotification);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ShowPushNotificationAction &&
              runtimeType == other.runtimeType &&
              inAppNotification == other.inAppNotification;

  @override
  int get hashCode => inAppNotification.hashCode;
}

class OnPushNotificationDismissedAction {}
