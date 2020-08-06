import 'package:built_value/built_value.dart';
import 'package:stockton/models/channel.dart';

part 'in_app_notification.g.dart';


abstract class InAppNotification implements Built<InAppNotification, InAppNotificationBuilder> {

  String get groupId;

  String get groupName;

  String get memberName;

  String get message;

  Channel get channel;

  InAppNotification._();
  factory InAppNotification([void Function(InAppNotificationBuilder) updates]) = _$InAppNotification;
}
