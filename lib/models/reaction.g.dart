// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Reaction extends Reaction {
  @override
  final String emoji;
  @override
  final int memberId;
  @override
  final String memberName;
  @override
  final DateTime timestamp;

  factory _$Reaction([void Function(ReactionBuilder) updates]) =>
      (new ReactionBuilder()..update(updates)).build();

  _$Reaction._({this.emoji, this.memberId, this.memberName, this.timestamp})
      : super._() {
    if (emoji == null) {
      throw new BuiltValueNullFieldError('Reaction', 'emoji');
    }
    if (memberId == null) {
      throw new BuiltValueNullFieldError('Reaction', 'memberId');
    }
    if (memberName == null) {
      throw new BuiltValueNullFieldError('Reaction', 'memberName');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('Reaction', 'timestamp');
    }
  }

  @override
  Reaction rebuild(void Function(ReactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReactionBuilder toBuilder() => new ReactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reaction &&
        emoji == other.emoji &&
        memberId == other.memberId &&
        memberName == other.memberName &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, emoji.hashCode), memberId.hashCode),
            memberName.hashCode),
        timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Reaction')
          ..add('emoji', emoji)
          ..add('memberId', memberId)
          ..add('memberName', memberName)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class ReactionBuilder implements Builder<Reaction, ReactionBuilder> {
  _$Reaction _$v;

  String _emoji;
  String get emoji => _$this._emoji;
  set emoji(String emoji) => _$this._emoji = emoji;

  int _memberId;
  int get memberId => _$this._memberId;
  set memberId(int memberId) => _$this._memberId = memberId;

  String _memberName;
  String get memberName => _$this._memberName;
  set memberName(String memberName) => _$this._memberName = memberName;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  ReactionBuilder();

  ReactionBuilder get _$this {
    if (_$v != null) {
      _emoji = _$v.emoji;
      _memberId = _$v.memberId;
      _memberName = _$v.memberName;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reaction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Reaction;
  }

  @override
  void update(void Function(ReactionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Reaction build() {
    final _$result = _$v ??
        new _$Reaction._(
            emoji: emoji,
            memberId: memberId,
            memberName: memberName,
            timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
