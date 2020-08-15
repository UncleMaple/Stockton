import 'package:built_value/built_value.dart';

part 'calendar_entry.g.dart';

abstract class CalendarEntry
    implements Built<CalendarEntry, CalendarEntryBuilder> {
  int get channelId;

  String get channelName;

  int get groupId;

  String get groupName;

  DateTime get eventDate;

  bool get hasStartTime;

  CalendarEntry._();

  factory CalendarEntry([void Function(CalendarEntryBuilder) updates]) =
      _$CalendarEntry;
}
