// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_list_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChannelListViewModel extends ChannelListViewModel {
  @override
  final Member member;
  @override
  final BuiltList<ChannelListItem> items;

  factory _$ChannelListViewModel(
          [void Function(ChannelListViewModelBuilder) updates]) =>
      (new ChannelListViewModelBuilder()..update(updates)).build();

  _$ChannelListViewModel._({this.member, this.items}) : super._() {
    if (member == null) {
      throw new BuiltValueNullFieldError('ChannelListViewModel', 'member');
    }
    if (items == null) {
      throw new BuiltValueNullFieldError('ChannelListViewModel', 'items');
    }
  }

  @override
  ChannelListViewModel rebuild(
          void Function(ChannelListViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelListViewModelBuilder toBuilder() =>
      new ChannelListViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChannelListViewModel &&
        member == other.member &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, member.hashCode), items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChannelListViewModel')
          ..add('member', member)
          ..add('items', items))
        .toString();
  }
}

class ChannelListViewModelBuilder
    implements Builder<ChannelListViewModel, ChannelListViewModelBuilder> {
  _$ChannelListViewModel _$v;

  MemberBuilder _member;
  MemberBuilder get member => _$this._member ??= new MemberBuilder();
  set member(MemberBuilder member) => _$this._member = member;

  ListBuilder<ChannelListItem> _items;
  ListBuilder<ChannelListItem> get items =>
      _$this._items ??= new ListBuilder<ChannelListItem>();
  set items(ListBuilder<ChannelListItem> items) => _$this._items = items;

  ChannelListViewModelBuilder();

  ChannelListViewModelBuilder get _$this {
    if (_$v != null) {
      _member = _$v.member?.toBuilder();
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChannelListViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChannelListViewModel;
  }

  @override
  void update(void Function(ChannelListViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChannelListViewModel build() {
    _$ChannelListViewModel _$result;
    try {
      _$result = _$v ??
          new _$ChannelListViewModel._(
              member: member.build(), items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'member';
        member.build();
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChannelListViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
