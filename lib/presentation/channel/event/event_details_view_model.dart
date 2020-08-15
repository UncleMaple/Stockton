import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";
import "package:flutter/cupertino.dart" as prefix0;
import "package:redux/redux.dart";
import 'package:stockton/models/channel.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/redux/app_selector.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/util/date_formatting.dart';

// ignore: prefer_double_quotes
part 'event_details_view_model.g.dart';

abstract class EventDetailsViewModel
    implements Built<EventDetailsViewModel, EventDetailsViewModelBuilder> {
  String get name;

  String get description;

  ChannelVisibility get visibility;

  BuiltList<Member> get members;

  BuiltMap<int, RSVP> get rsvpStatus;

  int get guestCount;

  int get groupId;

  Channel get channel;

  String get eventDate;

  String get eventTime;

  String get venue;

  Member get member;

  RSVP get memberRsvp;

  bool get editable;

  bool get canChangeRsvp;

  EventDetailsViewModel._();

  factory EventDetailsViewModel(
      [void Function(EventDetailsViewModelBuilder) updates]) =
  _$EventDetailsViewModel;

  static EventDetailsViewModel fromStore(context, Store<AppState> store) {
    final channel = getSelectedChannel(store.state);
    final members = store.state.groupMembers
        .where((user) => channel.members.any((u) => u.id == user.id))
        .toList();

    final String dateString = _parseDate(context, channel);
    final String timeString = _parseTime(context, channel);
    final rsvpStatus =
    channel.members.asMap().map((k, v) => MapEntry(v.id, v.rsvp));

    members.sort((u1, u2) => _sortRsvpAndHost(rsvpStatus, u1, u2, channel.authorId));

    return EventDetailsViewModel((t) => t
      ..name = channel.name
      ..visibility = channel.visibility
      ..description = channel.description
      ..members.addAll(members)
      ..guestCount = rsvpStatus.values
          .where((v) => v == RSVP.YES || v == RSVP.MAYBE)
          .length
      ..rsvpStatus.addAll(rsvpStatus)
      ..groupId = store.state.selectedGroupId
      ..channel = channel.toBuilder()
      ..member = store.state.member.toBuilder()
      ..memberRsvp = rsvpStatus[store.state.member.id] ?? RSVP.UNSET
      ..editable = _isEditable(channel, store)
      ..eventDate = dateString
      ..eventTime = timeString
      ..canChangeRsvp = channel.startDate.isAfter(DateTime.now())
      ..venue = channel.venue ?? "");
  }

  // Allow to edit if:
  // 1. the current user is the author of the event
  // 2. the start date is after now (so, it did not pass)
  static bool _isEditable(Channel channel, Store<AppState> store) {
    return channel.authorId == store.state.member.id && channel.startDate.isAfter(DateTime.now());
  }

  static int _sortRsvpAndHost(Map<int, RSVP> rsvpStatus, Member u1, Member u2, int authorId) {

    // Helper to calculate a sorting score, smaller goes first
    int _rsvpVal(RSVP rsvp) {
      switch (rsvp) {
        case RSVP.YES:
          return 0;
        case RSVP.MAYBE:
          return 1;
        case RSVP.NO:
        case RSVP.UNSET:
        default:
          return 2;
      }
    }

    final rsvp1 = rsvpStatus[u1.id];
    final rsvp2 = rsvpStatus[u2.id];
    final u1Host = u1.id == authorId;
    final u2Host = u2.id == authorId;
    final val1 = u1Host ? -1 : _rsvpVal(rsvp1);
    final val2 = u2Host ? -1 : _rsvpVal(rsvp2);
    final diff = val1 - val2;
    if (diff == 0) {
      // Order by name if RSVP is same
      return u1.nickname.compareTo(u2.nickname);
    } else {
      return diff;
    }
  }

  static String _parseDate(context, Channel channel) {
    if (channel.startDate == null) {
      return "";
    }
    return formatDate(context, channel.startDate);
  }

  static String _parseTime(prefix0.BuildContext context, Channel channel) {
    if (channel.hasStartTime != null && !channel.hasStartTime) {
      return "";
    }
    return formatTime(context, channel.startDate);
  }
}
