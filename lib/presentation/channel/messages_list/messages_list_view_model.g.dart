// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_list_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessagesListViewModel extends MessagesListViewModel {
  @override
  final Member currentMember;
  @override
  final BuiltList<Message> messages;
  @override
  final bool memberIsMe;
  @override
  final BuiltMap<String, Member> authors;

  factory _$MessagesListViewModel(
          [void Function(MessagesListViewModelBuilder) updates]) =>
      (new MessagesListViewModelBuilder()..update(updates)).build();

  _$MessagesListViewModel._(
      {this.currentMember, this.messages, this.memberIsMe, this.authors})
      : super._() {
    if (messages == null) {
      throw new BuiltValueNullFieldError('MessagesListViewModel', 'messages');
    }
    if (memberIsMe == null) {
      throw new BuiltValueNullFieldError('MessagesListViewModel', 'memberIsMe');
    }
    if (authors == null) {
      throw new BuiltValueNullFieldError('MessagesListViewModel', 'authors');
    }
  }

  @override
  MessagesListViewModel rebuild(
          void Function(MessagesListViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessagesListViewModelBuilder toBuilder() =>
      new MessagesListViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessagesListViewModel &&
        currentMember == other.currentMember &&
        messages == other.messages &&
        memberIsMe == other.memberIsMe &&
        authors == other.authors;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, currentMember.hashCode), messages.hashCode),
            memberIsMe.hashCode),
        authors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessagesListViewModel')
          ..add('currentMember', currentMember)
          ..add('messages', messages)
          ..add('memberIsMe', memberIsMe)
          ..add('authors', authors))
        .toString();
  }
}

class MessagesListViewModelBuilder
    implements Builder<MessagesListViewModel, MessagesListViewModelBuilder> {
  _$MessagesListViewModel _$v;

  MemberBuilder _currentMember;
  MemberBuilder get currentMember =>
      _$this._currentMember ??= new MemberBuilder();
  set currentMember(MemberBuilder currentMember) =>
      _$this._currentMember = currentMember;

  ListBuilder<Message> _messages;
  ListBuilder<Message> get messages =>
      _$this._messages ??= new ListBuilder<Message>();
  set messages(ListBuilder<Message> messages) => _$this._messages = messages;

  bool _memberIsMe;
  bool get memberIsMe => _$this._memberIsMe;
  set memberIsMe(bool memberIsMe) => _$this._memberIsMe = memberIsMe;

  MapBuilder<String, Member> _authors;
  MapBuilder<String, Member> get authors =>
      _$this._authors ??= new MapBuilder<String, Member>();
  set authors(MapBuilder<String, Member> authors) => _$this._authors = authors;

  MessagesListViewModelBuilder();

  MessagesListViewModelBuilder get _$this {
    if (_$v != null) {
      _currentMember = _$v.currentMember?.toBuilder();
      _messages = _$v.messages?.toBuilder();
      _memberIsMe = _$v.memberIsMe;
      _authors = _$v.authors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessagesListViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessagesListViewModel;
  }

  @override
  void update(void Function(MessagesListViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessagesListViewModel build() {
    _$MessagesListViewModel _$result;
    try {
      _$result = _$v ??
          new _$MessagesListViewModel._(
              currentMember: _currentMember?.build(),
              messages: messages.build(),
              memberIsMe: memberIsMe,
              authors: authors.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currentMember';
        _currentMember?.build();
        _$failedField = 'messages';
        messages.build();

        _$failedField = 'authors';
        authors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MessagesListViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
