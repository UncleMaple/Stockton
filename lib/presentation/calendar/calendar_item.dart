import 'package:stockton/models/channel.dart';

abstract class CalendarItem {}

class CalendarHeaderItem implements CalendarItem {
  final DateTime date;
  final bool isToday;
  final bool isPast;
  CalendarHeaderItem({
    this.date,
    this.isToday,
    this.isPast,
  });
}

class CalendarEntryItem implements CalendarItem {
  final int eventId;
  final int groupId;
  final String eventName;
  final String groupName;
  final DateTime date;
  final RSVP rsvpStatus;
  final bool isSelected;
  final bool isAllDay;
  final bool isPast;
  CalendarEntryItem({
    this.eventId,
    this.groupId,
    this.eventName,
    this.groupName,
    this.date,
    this.rsvpStatus,
    this.isSelected,
    this.isAllDay,
    this.isPast,
  });
}
