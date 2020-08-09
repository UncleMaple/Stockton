// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final BuiltList<CalendarEntry> memberCalendar;
  @override
  final BuiltMap<String, Group> groups;
  @override
  final int selectedGroupId;
  @override
  final Member member;
  @override
  final BuiltList<Member> groupMembers;
  @override
  final ChannelState channelState;
  @override
  final BuiltList<Message> messagesOnScreen;
  @override
  final String fcmToken;
  @override
  final InAppNotification inAppNotification;
  @override
  final UiState uiState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.memberCalendar,
      this.groups,
      this.selectedGroupId,
      this.member,
      this.groupMembers,
      this.channelState,
      this.messagesOnScreen,
      this.fcmToken,
      this.inAppNotification,
      this.uiState})
      : super._() {
    if (memberCalendar == null) {
      throw new BuiltValueNullFieldError('AppState', 'memberCalendar');
    }
    if (groups == null) {
      throw new BuiltValueNullFieldError('AppState', 'groups');
    }
    if (groupMembers == null) {
      throw new BuiltValueNullFieldError('AppState', 'groupMembers');
    }
    if (channelState == null) {
      throw new BuiltValueNullFieldError('AppState', 'channelState');
    }
    if (messagesOnScreen == null) {
      throw new BuiltValueNullFieldError('AppState', 'messagesOnScreen');
    }
    if (uiState == null) {
      throw new BuiltValueNullFieldError('AppState', 'uiState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        memberCalendar == other.memberCalendar &&
        groups == other.groups &&
        selectedGroupId == other.selectedGroupId &&
        member == other.member &&
        groupMembers == other.groupMembers &&
        channelState == other.channelState &&
        messagesOnScreen == other.messagesOnScreen &&
        fcmToken == other.fcmToken &&
        inAppNotification == other.inAppNotification &&
        uiState == other.uiState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, memberCalendar.hashCode),
                                        groups.hashCode),
                                    selectedGroupId.hashCode),
                                member.hashCode),
                            groupMembers.hashCode),
                        channelState.hashCode),
                    messagesOnScreen.hashCode),
                fcmToken.hashCode),
            inAppNotification.hashCode),
        uiState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('memberCalendar', memberCalendar)
          ..add('groups', groups)
          ..add('selectedGroupId', selectedGroupId)
          ..add('member', member)
          ..add('groupMembers', groupMembers)
          ..add('channelState', channelState)
          ..add('messagesOnScreen', messagesOnScreen)
          ..add('fcmToken', fcmToken)
          ..add('inAppNotification', inAppNotification)
          ..add('uiState', uiState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  ListBuilder<CalendarEntry> _memberCalendar;
  ListBuilder<CalendarEntry> get memberCalendar =>
      _$this._memberCalendar ??= new ListBuilder<CalendarEntry>();
  set memberCalendar(ListBuilder<CalendarEntry> memberCalendar) =>
      _$this._memberCalendar = memberCalendar;

  MapBuilder<String, Group> _groups;
  MapBuilder<String, Group> get groups =>
      _$this._groups ??= new MapBuilder<String, Group>();
  set groups(MapBuilder<String, Group> groups) => _$this._groups = groups;

  int _selectedGroupId;
  int get selectedGroupId => _$this._selectedGroupId;
  set selectedGroupId(int selectedGroupId) =>
      _$this._selectedGroupId = selectedGroupId;

  MemberBuilder _member;
  MemberBuilder get member => _$this._member ??= new MemberBuilder();
  set member(MemberBuilder member) => _$this._member = member;

  ListBuilder<Member> _groupMembers;
  ListBuilder<Member> get groupMembers =>
      _$this._groupMembers ??= new ListBuilder<Member>();
  set groupMembers(ListBuilder<Member> groupMembers) =>
      _$this._groupMembers = groupMembers;

  ChannelStateBuilder _channelState;
  ChannelStateBuilder get channelState =>
      _$this._channelState ??= new ChannelStateBuilder();
  set channelState(ChannelStateBuilder channelState) =>
      _$this._channelState = channelState;

  ListBuilder<Message> _messagesOnScreen;
  ListBuilder<Message> get messagesOnScreen =>
      _$this._messagesOnScreen ??= new ListBuilder<Message>();
  set messagesOnScreen(ListBuilder<Message> messagesOnScreen) =>
      _$this._messagesOnScreen = messagesOnScreen;

  String _fcmToken;
  String get fcmToken => _$this._fcmToken;
  set fcmToken(String fcmToken) => _$this._fcmToken = fcmToken;

  InAppNotificationBuilder _inAppNotification;
  InAppNotificationBuilder get inAppNotification =>
      _$this._inAppNotification ??= new InAppNotificationBuilder();
  set inAppNotification(InAppNotificationBuilder inAppNotification) =>
      _$this._inAppNotification = inAppNotification;

  UiStateBuilder _uiState;
  UiStateBuilder get uiState => _$this._uiState ??= new UiStateBuilder();
  set uiState(UiStateBuilder uiState) => _$this._uiState = uiState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _memberCalendar = _$v.memberCalendar?.toBuilder();
      _groups = _$v.groups?.toBuilder();
      _selectedGroupId = _$v.selectedGroupId;
      _member = _$v.member?.toBuilder();
      _groupMembers = _$v.groupMembers?.toBuilder();
      _channelState = _$v.channelState?.toBuilder();
      _messagesOnScreen = _$v.messagesOnScreen?.toBuilder();
      _fcmToken = _$v.fcmToken;
      _inAppNotification = _$v.inAppNotification?.toBuilder();
      _uiState = _$v.uiState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              memberCalendar: memberCalendar.build(),
              groups: groups.build(),
              selectedGroupId: selectedGroupId,
              member: _member?.build(),
              groupMembers: groupMembers.build(),
              channelState: channelState.build(),
              messagesOnScreen: messagesOnScreen.build(),
              fcmToken: fcmToken,
              inAppNotification: _inAppNotification?.build(),
              uiState: uiState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'memberCalendar';
        memberCalendar.build();
        _$failedField = 'groups';
        groups.build();

        _$failedField = 'member';
        _member?.build();
        _$failedField = 'groupMembers';
        groupMembers.build();
        _$failedField = 'channelState';
        channelState.build();
        _$failedField = 'messagesOnScreen';
        messagesOnScreen.build();

        _$failedField = 'inAppNotification';
        _inAppNotification?.build();
        _$failedField = 'uiState';
        uiState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
