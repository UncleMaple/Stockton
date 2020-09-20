// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_screen_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MemberScreenViewModel extends MemberScreenViewModel {
  @override
  final Member member;
  @override
  final bool isMe;
  @override
  final void Function(Member member, Completer completer) submit;

  factory _$MemberScreenViewModel(
          [void Function(MemberScreenViewModelBuilder) updates]) =>
      (new MemberScreenViewModelBuilder()..update(updates)).build();

  _$MemberScreenViewModel._({this.member, this.isMe, this.submit}) : super._() {
    if (member == null) {
      throw new BuiltValueNullFieldError('MemberScreenViewModel', 'member');
    }
    if (isMe == null) {
      throw new BuiltValueNullFieldError('MemberScreenViewModel', 'isMe');
    }
    if (submit == null) {
      throw new BuiltValueNullFieldError('MemberScreenViewModel', 'submit');
    }
  }

  @override
  MemberScreenViewModel rebuild(
          void Function(MemberScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemberScreenViewModelBuilder toBuilder() =>
      new MemberScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemberScreenViewModel &&
        member == other.member &&
        isMe == other.isMe;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, member.hashCode), isMe.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MemberScreenViewModel')
          ..add('member', member)
          ..add('isMe', isMe)
          ..add('submit', submit))
        .toString();
  }
}

class MemberScreenViewModelBuilder
    implements Builder<MemberScreenViewModel, MemberScreenViewModelBuilder> {
  _$MemberScreenViewModel _$v;

  MemberBuilder _member;
  MemberBuilder get member => _$this._member ??= new MemberBuilder();
  set member(MemberBuilder member) => _$this._member = member;

  bool _isMe;
  bool get isMe => _$this._isMe;
  set isMe(bool isMe) => _$this._isMe = isMe;

  void Function(Member member, Completer completer) _submit;
  void Function(Member member, Completer completer) get submit =>
      _$this._submit;
  set submit(void Function(Member member, Completer completer) submit) =>
      _$this._submit = submit;

  MemberScreenViewModelBuilder();

  MemberScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _member = _$v.member?.toBuilder();
      _isMe = _$v.isMe;
      _submit = _$v.submit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemberScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MemberScreenViewModel;
  }

  @override
  void update(void Function(MemberScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MemberScreenViewModel build() {
    _$MemberScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$MemberScreenViewModel._(
              member: member.build(), isMe: isMe, submit: submit);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'member';
        member.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MemberScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
