import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:stockton/models/channel.dart';
import 'package:stockton/models/member.dart';

@immutable
class LoadChannels {
  final int groupId;

  const LoadChannels(this.groupId);

  @override
  String toString() {
    // TODO: implement toString
    return "LoadChannels{groupId: $groupId}";
  }
}

@immutable
class OnChannelsLoaded {
  final int groupId;
  final List<Channel> channels;

  const OnChannelsLoaded(this.groupId, this.channels);

  @override
  String toString() {
    return "OnChannelsLoaded{groupId: $groupId, channels: $channels}";
  }
}

@immutable
class CreateChannel {
  final Channel channel;
  final BuiltList<int> invitedIds;
  final Completer completer;

  const CreateChannel(
      this.channel,
      this.invitedIds,
      this.completer,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CreateChannel &&
              runtimeType == other.runtimeType &&
              channel == other.channel &&
              invitedIds == other.invitedIds;

  @override
  int get hashCode =>
      channel.hashCode ^
      invitedIds.hashCode;

  @override
  String toString() {
    return "CreateChannel{channel: $channel, invitedIds: $invitedIds}";
  }
}

@immutable
class OnChannelCreated {
  final Channel channel;

  const OnChannelCreated(
      this.channel,
      );
}

@immutable
class EditChannelAction {
  final Channel channel;
  final Completer completer;

  const EditChannelAction(
      this.channel,
      this.completer,
      );
}

@immutable
class OnUpdatedChannelAction {
  final int groupId;
  final Channel selectedChannel;

  const OnUpdatedChannelAction(this.groupId, this.selectedChannel);
}

@immutable
class SelectChannelIdAction {
  final int previousChannelId;
  final int channelId;
  final int memberId;
  final int groupId;

  const SelectChannelIdAction({
    this.previousChannelId,
    this.channelId,
    this.groupId,
    this.memberId,
  });
}

@immutable
class SelectChannel {
  final int previousChannelId;
  final Channel channel;
  final int memberId;
  final int groupId;

  const SelectChannel({
    this.previousChannelId,
    this.channel,
    this.groupId,
    this.memberId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SelectChannel &&
              runtimeType == other.runtimeType &&
              previousChannelId == other.previousChannelId &&
              channel == other.channel &&
              memberId == other.memberId &&
              groupId == other.groupId;

  @override
  int get hashCode =>
      previousChannelId.hashCode ^
      channel.hashCode ^
      memberId.hashCode ^
      groupId.hashCode;

  @override
  String toString() {
    return "SelectChannel{previousChannelId: $previousChannelId, channel: $channel, userId: $memberId, groupId: $groupId}";
  }
}

@immutable
class JoinChannelAction {
  final int groupId;
  final Channel channel;
  final Member member;

  const JoinChannelAction({
    @required this.groupId,
    @required this.channel,
    @required this.member,
  });
}

@immutable
class JoinedChannelAction {
  final int groupId;
  final Channel channel;

  const JoinedChannelAction(
      this.groupId,
      this.channel,
      );
}

@immutable
class JoinChannelFailedAction {}

@immutable
class ClearFailedJoinAction {}

@immutable
class LeaveChannelAction {
  final int groupId;
  final Channel channel;
  final int memberId;

  const LeaveChannelAction(this.groupId, this.channel, this.memberId);
}

@immutable
class LeftChannelAction {
  final int groupId;
  final int channelId;
  final int memberId;

  const LeftChannelAction(this.groupId, this.channelId, this.memberId);
}

@immutable
class RsvpAction {
  final RSVP rsvp;
  final Completer completer;

  const RsvpAction(this.rsvp, this.completer);
}

@immutable
class InviteToChannelAction {
  final Iterable<String> users;
  final Channel channel;
  final Completer completer;

  const InviteToChannelAction(this.users, this.channel, this.completer);
}
