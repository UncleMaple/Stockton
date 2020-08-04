import 'dart:async';

import 'package:stockton/models/channel.dart';
import 'package:stockton/models/group.dart';
import 'package:stockton/models/member.dart';

// App member
StreamSubscription<Member> memberUpdateSubscription;
// List of user's groups
StreamSubscription<List<Group>> groupsSubscription;
// List of members of the current selected group
StreamSubscription<List<Member>> groupMembersSubscription;
// List of channels of the current selected group
StreamSubscription<List<Channel>> listOfChannelsSubscription;
// Selected channel
StreamSubscription<Channel> selectedChannelSubscription;
// Messages from selected channel
StreamSubscription<List<Message>> messagesSubscription;

/// 取消所有订阅
///
/// 在成功登出时调用
cancelAllSubscriptions() {
  memberUpdateSubscription?.cancel();
  groupsSubscription?.cancel();
  groupMembersSubscription?.cancel();
  listOfChannelsSubscription?.cancel();
  selectedChannelSubscription?.cancel();
  messagesSubscription?.cancel();
}
