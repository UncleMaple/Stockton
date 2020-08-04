// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Channel extends Channel {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final ChannelVisibility visibility;
  @override
  final BuiltList<ChannelMember> members;
  @override
  final String authorId;
  @override
  final bool hasUpdates;
  @override
  final ChannelType type;
  @override
  final String venue;
  @override
  final DateTime startDate;
  @override
  final bool hasStartTime;

  factory _$Channel([void Function(ChannelBuilder) updates]) =>
      (new ChannelBuilder()..update(updates)).build();

  _$Channel._(
      {this.id,
      this.name,
      this.description,
      this.visibility,
      this.members,
      this.authorId,
      this.hasUpdates,
      this.type,
      this.venue,
      this.startDate,
      this.hasStartTime})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Channel', 'name');
    }
    if (visibility == null) {
      throw new BuiltValueNullFieldError('Channel', 'visibility');
    }
    if (members == null) {
      throw new BuiltValueNullFieldError('Channel', 'members');
    }
    if (type == null) {
      throw new BuiltValueNullFieldError('Channel', 'type');
    }
  }

  @override
  Channel rebuild(void Function(ChannelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelBuilder toBuilder() => new ChannelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Channel &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        visibility == other.visibility &&
        members == other.members &&
        authorId == other.authorId &&
        hasUpdates == other.hasUpdates &&
        type == other.type &&
        venue == other.venue &&
        startDate == other.startDate &&
        hasStartTime == other.hasStartTime;
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
                                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                                        description.hashCode),
                                    visibility.hashCode),
                                members.hashCode),
                            authorId.hashCode),
                        hasUpdates.hashCode),
                    type.hashCode),
                venue.hashCode),
            startDate.hashCode),
        hasStartTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Channel')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('visibility', visibility)
          ..add('members', members)
          ..add('authorId', authorId)
          ..add('hasUpdates', hasUpdates)
          ..add('type', type)
          ..add('venue', venue)
          ..add('startDate', startDate)
          ..add('hasStartTime', hasStartTime))
        .toString();
  }
}

class ChannelBuilder implements Builder<Channel, ChannelBuilder> {
  _$Channel _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ChannelVisibility _visibility;
  ChannelVisibility get visibility => _$this._visibility;
  set visibility(ChannelVisibility visibility) =>
      _$this._visibility = visibility;

  ListBuilder<ChannelMember> _members;
  ListBuilder<ChannelMember> get members =>
      _$this._members ??= new ListBuilder<ChannelMember>();
  set members(ListBuilder<ChannelMember> members) => _$this._members = members;

  String _authorId;
  String get authorId => _$this._authorId;
  set authorId(String authorId) => _$this._authorId = authorId;

  bool _hasUpdates;
  bool get hasUpdates => _$this._hasUpdates;
  set hasUpdates(bool hasUpdates) => _$this._hasUpdates = hasUpdates;

  ChannelType _type;
  ChannelType get type => _$this._type;
  set type(ChannelType type) => _$this._type = type;

  String _venue;
  String get venue => _$this._venue;
  set venue(String venue) => _$this._venue = venue;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  bool _hasStartTime;
  bool get hasStartTime => _$this._hasStartTime;
  set hasStartTime(bool hasStartTime) => _$this._hasStartTime = hasStartTime;

  ChannelBuilder();

  ChannelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _visibility = _$v.visibility;
      _members = _$v.members?.toBuilder();
      _authorId = _$v.authorId;
      _hasUpdates = _$v.hasUpdates;
      _type = _$v.type;
      _venue = _$v.venue;
      _startDate = _$v.startDate;
      _hasStartTime = _$v.hasStartTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Channel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Channel;
  }

  @override
  void update(void Function(ChannelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Channel build() {
    _$Channel _$result;
    try {
      _$result = _$v ??
          new _$Channel._(
              id: id,
              name: name,
              description: description,
              visibility: visibility,
              members: members.build(),
              authorId: authorId,
              hasUpdates: hasUpdates,
              type: type,
              venue: venue,
              startDate: startDate,
              hasStartTime: hasStartTime);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'members';
        members.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Channel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChannelMember extends ChannelMember {
  @override
  final String id;
  @override
  final RSVP rsvp;

  factory _$ChannelMember([void Function(ChannelMemberBuilder) updates]) =>
      (new ChannelMemberBuilder()..update(updates)).build();

  _$ChannelMember._({this.id, this.rsvp}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ChannelMember', 'id');
    }
    if (rsvp == null) {
      throw new BuiltValueNullFieldError('ChannelMember', 'rsvp');
    }
  }

  @override
  ChannelMember rebuild(void Function(ChannelMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelMemberBuilder toBuilder() => new ChannelMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChannelMember && id == other.id && rsvp == other.rsvp;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), rsvp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChannelMember')
          ..add('id', id)
          ..add('rsvp', rsvp))
        .toString();
  }
}

class ChannelMemberBuilder
    implements Builder<ChannelMember, ChannelMemberBuilder> {
  _$ChannelMember _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  RSVP _rsvp;
  RSVP get rsvp => _$this._rsvp;
  set rsvp(RSVP rsvp) => _$this._rsvp = rsvp;

  ChannelMemberBuilder();

  ChannelMemberBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _rsvp = _$v.rsvp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChannelMember other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChannelMember;
  }

  @override
  void update(void Function(ChannelMemberBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChannelMember build() {
    final _$result = _$v ?? new _$ChannelMember._(id: id, rsvp: rsvp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
