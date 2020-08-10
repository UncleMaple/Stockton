import "package:built_value/built_value.dart";

import "package:redux/redux.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/redux/app_selector.dart';
import 'package:stockton/redux/app_state.dart';

// ignore: prefer_double_quotes
part 'channel_screen_view_model.g.dart';

abstract class ChannelScreenViewModel
    implements Built<ChannelScreenViewModel, ChannelScreenViewModelBuilder> {
  bool get isAuthor;

  bool get userIsMember;

  int get groupId;

  Channel get channel;

  Member get member;

  bool get failedToJoin;

  RSVP get rsvpStatus;

  ChannelScreenViewModel._();

  factory ChannelScreenViewModel(
      [void Function(ChannelScreenViewModelBuilder) updates]) =
  _$ChannelScreenViewModel;

  static ChannelScreenViewModel fromStore(Store<AppState> store) {
    final selectedChannel = getSelectedChannel(store.state);
    final hasSelectedChannel = selectedChannel != null;
    final channelUser = selectedChannel
        ?.members
        ?.firstWhere((u) => u.id == store.state.member.id, orElse: () => null);

    return ChannelScreenViewModel((v) => v
      ..isAuthor =
          selectedChannel.authorId == store.state.member.id
      ..userIsMember = hasSelectedChannel && channelUser != null
      ..groupId = hasSelectedChannel ? store.state.selectedGroupId : ""
      ..channel = selectedChannel.toBuilder()
      ..member = store.state.member.toBuilder()
      ..failedToJoin = store.state.channelState.joinChannelFailed
      ..rsvpStatus = channelUser?.rsvp ?? RSVP.UNSET);
  }
}
