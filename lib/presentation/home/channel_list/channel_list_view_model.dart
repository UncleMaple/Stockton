import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";
import "package:flutter/widgets.dart" as W;
import "package:redux/redux.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/presentation/home/channel_list/channel_list_item.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/util/routes.dart';

// ignore: prefer_double_quotes
part 'channel_list_view_model.g.dart';

abstract class ChannelListViewModel
    implements Built<ChannelListViewModel, ChannelListViewModelBuilder> {
  Member get member;

  BuiltList<ChannelListItem> get items;

  ChannelListViewModel._();

  factory ChannelListViewModel(
      [void Function(ChannelListViewModelBuilder) updates]) =
  _$ChannelListViewModel;

  static ChannelListViewModel fromStore(Store<AppState> store) {
    final groupId = store.state.selectedGroupId;
    final member = store.state.member;
    final circle = store.state.groups[groupId];
    final channels = circle.channels.values.toList();
    final selectedChannelId = store.state.channelState.selectedChannel;

    _filterIrrelevantChannel(channels, member);

    final updatedChannels = channels
        .where((c) => c.members.any((u) => u.id == member.id) && c.hasUpdates)
        .toList();

    final list = [
      ChannelListHeadingItem(
          text: circle.name, type: ChannelListHeadingItemType.H1),
      ..._buildUnreadSection(
          _toChannelItem(updatedChannels, selectedChannelId, member.id)),
      ..._buildEventSection(
          channels: channels,
          selectedChannelId: selectedChannelId,
          memberId: member.id),
      ..._buildGroupSection(
          channels: channels,
          selectedChannelId: selectedChannelId,
          memberId: member.id)
    ];

    return ChannelListViewModel((c) => c
      ..member = member.toBuilder()
      ..items = ListBuilder(list));
  }

  // Filter unjoined private channels. This should eventually be moved to the backend.
  static _filterIrrelevantChannel(List<Channel> channels, member) {
    channels.removeWhere((c) =>
    c.visibility == ChannelVisibility.CLOSED &&
        !c.members.any((u) => u.id == member.id));
  }

  // Building list group for regular channels.
  static _buildGroupSection({channels, selectedChannelId, memberId}) {
    final List<Channel> unjoinedChannels = channels
        .where((Channel c) =>
    !c.members.any((u) => u.id == memberId) && c.type == ChannelType.TOPIC)
        .toList();

    final List<Channel> readChannels = channels
        .where((c) =>
    c.type == ChannelType.TOPIC &&
        c.members.any((u) => u.id == memberId) &&
        (!c.hasUpdates || c.hasUpdates == null))
        .toList();

    _sortChannelsByName(readChannels);
    _sortChannelsByName(unjoinedChannels);

    // Only show joined and unjoined section when there is content:
    var unjoinedSection = [];
    var joinedAndReadSection = [];

    if (readChannels.length > 0) {
      joinedAndReadSection = [
        ChannelListHeadingItem(key: ChannelLocalizedKey.JOINED),
        ..._toChannelItem(readChannels, selectedChannelId, memberId)
      ];
    }

    if (unjoinedChannels.length > 0) {
      unjoinedSection = [
        ChannelListHeadingItem(key: ChannelLocalizedKey.PENDING),
        ..._toChannelItem(unjoinedChannels, selectedChannelId, memberId)
      ];
    }

    return [
      ChannelListActionItem(
        ChannelLocalizedKey.TOPICS,
            (context) {
          W.Navigator.pushNamed(context, Routes.channelNew);
        },
      ),
      ...joinedAndReadSection,
      ...unjoinedSection
    ];
  }

  static _sortChannelsByName(List<Channel> channels) {
    channels
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  // Building list group for event channels.
  static _buildEventSection({channels, selectedChannelId, memberId}) {
    final List<Channel> events =
    channels.where((c) => c.type == ChannelType.EVENT).toList();

    // Sort events by date.
    events.sort((Channel a, Channel b) {
      return a.startDate.compareTo(b.startDate);
    });

    final now = DateTime.now();
    final today = now.add(Duration(
        hours: -now.hour, minutes: -now.minute, seconds: -(now.second + 1)));

    final upcomingIndex = events.indexWhere((c) => today.isBefore(c.startDate));
    var upcomingEvents = [];
    var previousEvents = [];

    if (events.length > 0) {
      final eventItems = _toChannelItem(events, selectedChannelId, memberId);

      // If upcomingIndex is == -1 there's no upcoming events
      if (upcomingIndex >= 0) {
        final upcomingChannelListItems =
        eventItems.getRange(upcomingIndex, eventItems.length);
        if (upcomingChannelListItems.length > 0) {
          upcomingEvents = [
            ChannelListHeadingItem(key: ChannelLocalizedKey.UPCOMING),
            ...upcomingChannelListItems.toList()
          ];
        }
      }

      var previousChannelListItems;
      if (upcomingIndex >= 0) {
        previousChannelListItems = eventItems.getRange(0, upcomingIndex);
      } else {
        // if upcomingIndex == -1 then ALL events have passed
        previousChannelListItems = eventItems;
      }
      if (previousChannelListItems.length > 0) {
        previousEvents = [
          ChannelListHeadingItem(key: ChannelLocalizedKey.PREVIOUS),
          ...previousChannelListItems.toList()
        ];
      }
    }

    return [
      ChannelListActionItem(
        ChannelLocalizedKey.EVENTS,
            (context) {
          W.Navigator.pushNamed(context, Routes.eventNew);
        },
      ),
      ...upcomingEvents,
      ...previousEvents
    ];
  }

  // Building list group for all unread channels (including events).
  // This is sorted by most recent activity.

  static _buildUnreadSection(List<ChannelListItem> unreadChannelItems) {
    return unreadChannelItems.length > 0
        ? [
      ChannelListHeadingItem(
          key: ChannelLocalizedKey.UNREAD,
          type: ChannelListHeadingItemType.H2),
      ...unreadChannelItems
    ]
        : [];
  }

  static List<ChannelListChannelItem> _toChannelItem(
      List<Channel> channels, int selectedChannelId, int memberId) {
    return channels
        .map((item) => ChannelListChannelItem(
      item,
      item.name,
      item.members.any((u) => u.id == memberId),
      item.visibility == ChannelVisibility.OPEN,
      selectedChannelId == item.id,
    ))
        .toList();
  }
}
