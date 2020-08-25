import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stockton/presentation/common/platform_alerts.dart';

final localizationsDelegates = <LocalizationsDelegate>[
  const StocktonLocalizationsDelegate(),
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  const FallbackCupertinoLocalisationsDelegate()
];

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) => false;
}

class StocktonLocalizationsDelegate
    extends LocalizationsDelegate<StocktonLocalizations> {
  const StocktonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  Future<StocktonLocalizations> load(Locale locale) {
    return SynchronousFuture<StocktonLocalizations>(
        StocktonLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<StocktonLocalizations> old) {
    return false;
  }
}

class StocktonLocalizations {
  StocktonLocalizations(this.locale);

  final Locale locale;

  static StocktonLocalizations of(BuildContext context) {
    return Localizations.of<StocktonLocalizations>(
        context, StocktonLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {
      // Auth
      "log_out": "Log out",
      "log_in": "Log in",
      "hello_name": "Hello {name}!",
      "login_fail_member_not_found": "Login failed. No such member exists.",
      "login_fail": "Login failed. Code: '{code}'",
      // calendar
      "calendar_title": "Calendar",
      "calendar_text_today": "Today:",
      "calendar_text_all_day": "all day",
      // channel
      "channel_join": "Join Topic",
      "channel_join_message": "Join the topic to send messages.",
      "channel_joined_postfix_message": "joined channel",
      "channel_joined_event_postfix_message": "joined event",
      "channel_left_postfix_message": "left channel",
      "channel_left_event_postfix_message": "left event",
      "channel_leave_alert_title": "Leave channel",
      "channel_leave_alert_message": "Do you really want to leave?",
      "channel_create_title": "Create Topic",
      "channel_create_button": "Create",
      "channel_input_hint": "Message",
      "channel_input_send": "Send",
      "channel_title": "Topics",
      "channel_list_pending": "UNJOINED",
      "channel_list_joined": "JOINED",
      "channel_list_previous": "PREVIOUS",
      "channel_list_upcoming": "UPCOMING",
      "channel_list_events": "Events",
      "channel_list_unread": "Unread",
      "channel_form_topic_name": "Enter topic name",
      "channel_form_topic_description": "Enter purpose (optional)",
      "channel_form_topic_description_helper":
          "Briefly describe the purpose of this channel",
      "channel_form_create_topic": "Create Topic",
      "channel_form_create_topic_empty_error": "Maximum 30 characters",
      "channel_form_create_topic_exists_error": "This topic already exists.",
      "channel_form_create_topic_public": "Open",
      "channel_form_create_topic_private": "Private",
      "channel_form_create_topic_public_helper":
          "Everyone in this group can join",
      "channel_form_create_topic_private_helper":
          "Invite group members to this topic:",
      "channel_form_topic_exists":
          "There already exists a topic with this name.",
      "channel_form_select_members_error": "Please select at least one member.",
      "channel_form_select_members":
          "Select the members who can join the topic:",
      "channel_invite_title": "Invite more members",
      "channel_invite_button": "Add more members",
      "channel_rsvp_yes_postfix": "is going",
      "channel_rsvp_no_postfix": "is not going",
      "channel_rsvp_maybe_postfix": "is maybe going",
      // attach_modal
      "attach_modal_title": "Attach Picture",
      "attach_modal_subtitle": "Select from",
      "attach_modal_camera": "Camera",
      "attach_modal_gallery": "Photo Library",
      "attach_error": "Error attaching picture",
      // Privacy
      "privacy_button": "Privacy policy",
      "privacy_link": "https://www.baidu.com/",
      // generic
      "generic_soon_alert_title": "We are working on it",
      "generic_soon_alert_message":
          "This functionality will be available soon.",
      "generic_yes": "Yes",
      "generic_cancel": "Cancel",
      "generic_next": "Next",
      "generic_ok": "OK",
      "generic_back": "Back",
      "generic_at": "at",
      "generic_you": "You",
      "generic_save": "Save",
      "generic_edit": "Edit",
      "generic_delete": "Delete",
      "generic_invite": "Invite",
      // event
      "event_edit_title": "Edit Event",
      "event_form_name": "Event name",
      "event_form_date": "Select date",
      "event_form_date_empty": "Missing date",
      "event_form_date_past": "Past date",
      "event_form_time": "Select time (optional)",
      "event_form_venue": "Venue (optional)",
      "event_form_venue_helper": "Help your guests to find the venue",
      "event_form_purpose": "Enter event purpose (optional)",
      "event_form_purpose_helper": "Briefly describe the purpose of this event",
      "event_form_title": "Create Event",
      "event_host": "Host",
      "event_guest_count": "Guests ({count})",
      "event_details": "Event Details",
      "event_guests": "Guests",
      "event_leave": "Leave Event",
      "event_rsvp_yes_dialog": "You're going!",
      "event_rsvp_maybe_dialog": "You replied maybe",
      "event_rsvp_no_dialog": "You've declined!",
      "event_rsvp_yes": "Going",
      "event_rsvp_maybe": "Maybe",
      "event_rsvp_no": "Not Going",
      "event_rsvp_user": "Your response:",
      "event_rsvp_change": "Change",
      "event_private": "Private Event",
      "generic_create": "Create",
      // setting
      "settings_title": "Settings",
      // topic
      "topic_details": "Topic Details",
      "topic_members": "Members",
      "topic_leave": "Leave Topic",
      "topic_private": "Private Topic",
      "topic_members_count": "Members {count}",
      // platform_alert
      "platform_alert_access_title": "Please grant Timy access",
      "platform_alert_access_body":
          "For this feature to work the app need access to your {RESOURCE}",
      "platform_alert_access_resource_camera": "camera",
      "platform_alert_access_resource_photos": "photos",
      // member
      "member_send_direct_message": "Send direct message",
      "member_edit_name_label": "Your name",
      "member_edit_name_helper": "Maximum 30 characters",
      "member_edit_name_error": "Name cannot be empty",
      "member_edit_status_label": "Your status",
      "member_edit_status_helper": "Maximum 200 characters",
      "member_deleted": "[deleted]",
    },
    "ch": {
      // Auth
      "log_out": "登出",
      "log_in": "登入",
      "hello_name": "你好 {name}!",
      "login_fail_member_not_found": "登录失败, 该用户不存在",
      "login_fail": "登录失败, 错误: '{code}'",
      // calendar
      "calendar_title": "日程表",
      "calendar_text_today": "今天:",
      "calendar_text_all_day": "一整天",
      // channel
      "channel_join": "加入话题",
      "channel_join_message": "加入话题可以发送消息",
      "channel_joined_postfix_message": "已加入话题",
      "channel_joined_event_postfix_message": "已加入活动",
      "channel_left_postfix_message": "已离开话题",
      "channel_left_event_postfix_message": "已离开活动",
      "channel_leave_alert_title": "离开话题",
      "channel_leave_alert_message": "您确定要离开话题吗?",
      "channel_create_title": "创建活动主题",
      "channel_create_button": "创建",
      "channel_input_hint": "在这输入信息",
      "channel_input_send": "发送",
      "channel_title": "活动主题",
      "channel_list_pending": "未加入",
      "channel_list_joined": "已加入",
      "channel_list_previous": "过去的",
      "channel_list_upcoming": "要来的",
      "channel_list_events": "活动",
      "channel_list_unread": "未读",
      "channel_form_topic_name": "输入话题",
      "channel_form_topic_description": "输入原因(可选)",
      "channel_form_topic_description_helper": "简单介绍下活动意图",
      "channel_form_create_topic": "创建活动",
      "channel_form_create_topic_empty_error": "最大长度不超过30",
      "channel_form_create_topic_exists_error": "活动已存在",
      "channel_form_create_topic_public": "打开",
      "channel_form_create_topic_private": "私有",
      "channel_form_create_topic_public_helper": "群组中任何人可加入",
      "channel_form_create_topic_private_helper": "邀请群组成员加入活动:",
      "channel_form_topic_exists": "该活动名已存在",
      "channel_form_select_members_error": "请至少选择一位成员",
      "channel_form_select_members": "请选择可以加入活动的成员:",
      "channel_invite_title": "邀请更多成员",
      "channel_invite_button": "添加更多成员",
      "channel_rsvp_yes_postfix": "会去的",
      "channel_rsvp_no_postfix": "不会去",
      "channel_rsvp_maybe_postfix": "可能去",
      // attach_modal
      "attach_modal_title": "绑定图片",
      "attach_modal_subtitle": "Select from",
      "attach_modal_camera": "Camera",
      "attach_modal_gallery": "Photo Library",
      "attach_error": "Error attaching picture",
      // Privacy
      "privacy_button": "隐私保护",
      "privacy_link": "https://www.baidu.com/",
      // generic
      "generic_soon_alert_title": "开发中",
      "generic_soon_alert_message": "该功能正在赶来的路上..",
      "generic_yes": "好的",
      "generic_cancel": "取消",
      "generic_next": "下一个",
      "generic_ok": "好的",
      "generic_back": "返回",
      "generic_at": "在",
      "generic_you": "你",
      "generic_save": "保存",
      "generic_edit": "编辑",
      "generic_delete": "删除",
      "generic_invite": "邀请",
      // event
      "event_edit_title": "Edit Event",
      "event_form_name": "Event name",
      "event_form_date": "Select date",
      "event_form_date_empty": "Missing date",
      "event_form_date_past": "Past date",
      "event_form_time": "Select time (optional)",
      "event_form_venue": "Venue (optional)",
      "event_form_venue_helper": "Help your guests to find the venue",
      "event_form_purpose": "Enter event purpose (optional)",
      "event_form_purpose_helper": "Briefly describe the purpose of this event",
      "event_form_title": "Create Event",
      "event_host": "Host",
      "event_guest_count": "Guests ({count})",
      "event_details": "Event Details",
      "event_guests": "Guests",
      "event_leave": "Leave Event",
      "event_rsvp_yes_dialog": "You're going!",
      "event_rsvp_maybe_dialog": "You replied maybe",
      "event_rsvp_no_dialog": "You've declined!",
      "event_rsvp_yes": "Going",
      "event_rsvp_maybe": "Maybe",
      "event_rsvp_no": "Not Going",
      "event_rsvp_user": "Your response:",
      "event_rsvp_change": "Change",
      "event_private": "Private Event",
      "generic_create": "Create",
      // setting
      "settings_title": "Settings",
      // topic
      "topic_details": "Topic Details",
      "topic_members": "Members",
      "topic_leave": "Leave Topic",
      "topic_private": "Private Topic",
      "topic_members_count": "Members {count}",
      // platform_alert
      "platform_alert_access_title": "Please grant Timy access",
      "platform_alert_access_body":
          "For this feature to work the app need access to your {RESOURCE}",
      "platform_alert_access_resource_camera": "camera",
      "platform_alert_access_resource_photos": "photos",
      // member
      "member_send_direct_message": "Send direct message",
      "member_edit_name_label": "Your name",
      "member_edit_name_helper": "Maximum 30 characters",
      "member_edit_name_error": "Name cannot be empty",
      "member_edit_status_label": "Your status",
      "member_edit_status_helper": "Maximum 200 characters",
      "member_deleted": "[deleted]",
    }
  };

  String _localizedValue(String id) =>
      _localizedValues[locale.languageCode][id] ?? _localizedValues["en"][id];

  // Auth
  String get logIn => _localizedValue("log_in");

  String get logOut => _localizedValue("log_out");

  String hello(String name) =>
      _localizedValue("hello_name").replaceAll("{name}", name);

  String authErrorMessage(String code) {
    switch (code) {
      case "ERROR_MEMBER_LOGIN":
        return _localizedValue("login_fail").replaceAll("{code}", "400");
      case "":
        return null;
      default:
        return _localizedValue("login_fail").replaceAll("{code}", code);
    }
  }

  // Calendar

  String get calendarTitle => _localizedValue("calendar_title");

  String get calendarStringToday => _localizedValue("calendar_text_today");

  String get calendarStringAllDay => _localizedValue("calendar_text_all_day");

  // Channel
  String get channelJoinMessage {
    return _localizedValue("channel_join_message");
  }

  String get channelLeaveAlertTitle {
    return _localizedValue("channel_leave_alert_title");
  }

  String get channelLeaveAlertMessage {
    return _localizedValue("channel_leave_alert_message");
  }

  String get channelJoin {
    return _localizedValue("channel_join");
  }

  String get channelCreateTitle {
    return _localizedValue("channel_create_title");
  }

  String get channelCreateButton {
    return _localizedValue("channel_create_button");
  }

  String get channelTitle {
    return _localizedValue("channel_title");
  }

  String get channelListPending {
    return _localizedValue("channel_list_pending");
  }

  String get channelListJoined {
    return _localizedValue("channel_list_joined");
  }

  String get channelListPrevious {
    return _localizedValue("channel_list_previous");
  }

  String get channelListUpcoming {
    return _localizedValue("channel_list_upcoming");
  }

  String get channelListEvents {
    return _localizedValue("channel_list_events");
  }

  String get channelListUnread {
    return _localizedValue("channel_list_unread");
  }

  String get channelFormTopicName {
    return _localizedValue("channel_form_topic_name");
  }

  String get channelFormTopicDescription {
    return _localizedValue("channel_form_topic_description");
  }

  String get channelFormTopicDescriptionHelper {
    return _localizedValue("channel_form_topic_description_helper");
  }

  String get channelFormCreateTopic {
    return _localizedValue("channel_form_create_topic");
  }

  String get channelFormCreateTopicEmptyError {
    return _localizedValue("channel_form_create_topic_empty_error");
  }

  String get channelFormCreateTopicExistsError {
    return _localizedValue("channel_form_create_topic_exists_error");
  }

  String get channelFormCreateTopicPrivate {
    return _localizedValue("channel_form_create_topic_private");
  }

  String get channelFormCreateTopicPublic {
    return _localizedValue("channel_form_create_topic_public");
  }

  String get channelFormCreateTopicPrivateHelper {
    return _localizedValue("channel_form_create_topic_private_helper");
  }

  String get channelFormCreateTopicPublicHelper {
    return _localizedValue("channel_form_create_topic_public_helper");
  }

  String get channelFormTopicExists {
    return _localizedValue("channel_form_topic_exists");
  }

  String get channelFormSelectMembersError {
    return _localizedValue("channel_form_select_members_error");
  }

  String get channelFormSelectMembers {
    return _localizedValue("channel_form_select_members");
  }

  String get channelInputHint {
    return _localizedValue("channel_input_hint");
  }

  String get channelInputSend {
    return _localizedValue("channel_input_send");
  }

  String get channelInviteTitle =>
      _localizedValues[locale.languageCode]["channel_invite_title"];

  String get invite => _localizedValues[locale.languageCode]["generic_invite"];

  get channelInviteButton =>
      _localizedValues[locale.languageCode]["channel_invite_button"];

  // Privacy
  String get privacyButton => _localizedValue("privacy_button");

  String get privacyLink => _localizedValue("privacy_link");

  // generic
  String get at => _localizedValue("generic_at");

  String get back => _localizedValue("generic_back");

  String get cancel => _localizedValue("generic_cancel");

  String get delete => _localizedValue("generic_delete");

  String get edit => _localizedValue("generic_edit");

  String get next => _localizedValue("generic_next");

  String get ok => _localizedValue("generic_ok");

  String get save => _localizedValue("generic_save");

  String get soonAlertTitle => _localizedValue("generic_soon_alert_title");

  String get soonAlertMessage => _localizedValue("generic_soon_alert_message");

  String get yes => _localizedValue("generic_yes");

  String get you => _localizedValue("generic_you");

  String get genericSoonAlertTitle =>
      _localizedValue("generic_soon_alert_title");

  String get genericSoonAlertMessage =>
      _localizedValue("generic_soon_alert_message");

  String get sendDirectMessage => _localizedValue("user_send_direct_message");

  String get userEditNameLabel => _localizedValue("user_edit_name_label");

  String get userEditNameHelper => _localizedValue("user_edit_name_helper");

  String get userEditNameError => _localizedValue("user_edit_name_error");

  String get userEditStatusLabel => _localizedValue("user_edit_status_label");

  String get userEditStatusHelper => _localizedValue("user_edit_status_helper");

  String get deletedMember => _localizedValue("member_deleted");

  // else
  String get attachModalTitle => _localizedValue("attach_modal_title");

  String get attachModalSubtitle => _localizedValue("attach_modal_subtitle");

  String get attachModalCamera => _localizedValue("attach_modal_camera");

  String get attachModalGallery => _localizedValue("attach_modal_gallery");

  String get attachError => _localizedValue("attach_error");

  String get eventEditTitle => _localizedValue("event_edit_title");

  String get eventFormName => _localizedValue("event_form_name");

  String get eventFormDate => _localizedValue("event_form_date");

  String get eventFormDateEmpty => _localizedValue("event_form_date_empty");

  String get eventFormDatePast => _localizedValue("event_form_date_past");

  String get eventFormTime => _localizedValue("event_form_time");

  String get eventFormVenue => _localizedValue("event_form_venue");

  String get eventFormVenueHelper => _localizedValue("event_form_venue_helper");

  String get eventFormPurpose => _localizedValue("event_form_purpose");

  String get eventFormPurposeHelper =>
      _localizedValue("event_form_purpose_helper");

  String get eventCreateTitle => _localizedValue("event_form_title");

  String eventGuestCount(String count) {
    return _localizedValue("event_guest_count").replaceAll("{count}", count);
  }

  String rsvpSystemMessage(String rsvpMessage) {
    return rsvpMessage
        .replaceAll("{RSVP_YES}", _channelRSVPYesPostfix)
        .replaceAll("{RSVP_MAYBE}", _channelRSVPMaybePostfix)
        .replaceAll("{RSVP_NO}", _channelRSVPNoPostfix);
  }

  String get _channelRSVPYesPostfix =>
      _localizedValue("channel_rsvp_yes_postfix");

  String get _channelRSVPNoPostfix =>
      _localizedValue("channel_rsvp_no_postfix");

  String get _channelRSVPMaybePostfix =>
      _localizedValue("channel_rsvp_maybe_postfix");

  String channelSystemMessage(String joinedChannelMessage) {
    return joinedChannelMessage
        .replaceAll("{JOINED_CHANNEL}", _joinChannelPostfix)
        .replaceAll("{JOINED_EVENT}", _joinEventPostfix)
        .replaceAll("{LEFT_EVENT}", _leftEventPostfix)
        .replaceAll("{LEFT_CHANNEL}", _leftChannelPostfix);
  }

  String get _joinChannelPostfix =>
      _localizedValue("channel_joined_postfix_message");

  String get _joinEventPostfix =>
      _localizedValue("channel_joined_event_postfix_message");

  String get _leftChannelPostfix =>
      _localizedValue("channel_left_postfix_message");

  String get _leftEventPostfix =>
      _localizedValue("channel_left_event_postfix_message");

  String get eventHost => _localizedValue("event_host");

  String get eventDetails => _localizedValue("event_details");

  String get eventGuests => _localizedValue("event_guests");

  String get eventLeave => _localizedValue("event_leave");

  String get eventRsvpDialogYes => _localizedValue("event_rsvp_yes_dialog");

  String get eventRsvpDialogMaybe => _localizedValue("event_rsvp_maybe_dialog");

  String get eventRsvpDialogNo => _localizedValue("event_rsvp_no_dialog");

  get eventRsvpYes => _localizedValue("event_rsvp_yes");

  get eventRsvpMaybe => _localizedValue("event_rsvp_maybe");

  get eventRsvpNo => _localizedValue("event_rsvp_no");

  get eventRsvpUser => _localizedValue("event_rsvp_user");

  get eventRsvpChange => _localizedValue("event_rsvp_change");

  get eventPrivate => _localizedValue("event_private");

  String get create => _localizedValue("generic_create");

  get settingsTitle => _localizedValue("settings_title");

  String get topicDetails {
    return _localizedValue("topic_details");
  }

  String get topicMembers {
    return _localizedValue("topic_members");
  }

  String get topicLeave {
    return _localizedValue("topic_leave");
  }

  String get topicPrivate {
    return _localizedValue("topic_private");
  }

  String topicMembersCount(String count) {
    return _localizedValue("topic_members_count").replaceAll("{count}", count);
  }

  /// Platform
  String get platformAlertAccessTitle => _localizedValue("platform_alert_access_title");

  String platformAlertAccessBody(AccessResourceType type) {
    final typeString = type == AccessResourceType.CAMERA ? platformAlertAccessResourceCamera : platformAlertAccessResourcePhotos;
    return _localizedValue("platform_alert_access_body").replaceAll("{RESOURCE}", typeString);
  }

  String get platformAlertAccessResourceCamera => _localizedValue("platform_alert_access_resource_camera");
  String get platformAlertAccessResourcePhotos => _localizedValue("platform_alert_access_resource_photos");
}
