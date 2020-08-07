import "package:built_value/built_value.dart";

import "package:redux/redux.dart";
import 'package:stockton/models/in_app_notification.dart';
import 'package:stockton/redux/app_actions.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/channel/channel_actions.dart';
import 'package:stockton/redux/push/push_actions.dart';

// ignore: prefer_double_quotes
part 'in_app_notification_view_model.g.dart';

abstract class InAppNotificationViewModel
    implements
        Built<InAppNotificationViewModel, InAppNotificationViewModelBuilder> {
  @nullable
  InAppNotification get inAppNotification;

  @BuiltValueField(compare: false)
  Function get onDismissed;

  @BuiltValueField(compare: false)
  Function get onTap;

  InAppNotificationViewModel._();

  factory InAppNotificationViewModel(
      [void Function(InAppNotificationViewModelBuilder) updates]) =
  _$InAppNotificationViewModel;

  static InAppNotificationViewModel fromStore(Store<AppState> store) {
    final previouslySelectedChannel = store.state.channelState.selectedChannel;
    return InAppNotificationViewModel((i) => i
      ..inAppNotification = store.state.inAppNotification?.toBuilder()
      ..onDismissed = () {
        store.dispatch(OnPushNotificationDismissedAction());
      }
      ..onTap = () {
        store.dispatch(SelectGroup(store.state.inAppNotification.groupId));
        store.dispatch(SelectChannel(
          previousChannelId: previouslySelectedChannel,
          channel: store.state.inAppNotification.channel,
          groupId: store.state.inAppNotification.groupId,
          memberId: store.state.member.id,
        ));
        store.dispatch(OnPushNotificationDismissedAction());
      });
  }
}
