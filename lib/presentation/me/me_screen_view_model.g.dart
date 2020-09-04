// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_screen_view_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeScreenViewModel extends MeScreenViewModel {
  @override
  final Member currentMember;

  factory _$MeScreenViewModel(
          [void Function(MeScreenViewModelBuilder) updates]) =>
      (new MeScreenViewModelBuilder()..update(updates)).build();

  _$MeScreenViewModel._({this.currentMember}) : super._() {
    if (currentMember == null) {
      throw new BuiltValueNullFieldError('MeScreenViewModel', 'currentMember');
    }
  }

  @override
  MeScreenViewModel rebuild(void Function(MeScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeScreenViewModelBuilder toBuilder() =>
      new MeScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeScreenViewModel && currentMember == other.currentMember;
  }

  @override
  int get hashCode {
    return $jf($jc(0, currentMember.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MeScreenViewModel')
          ..add('currentMember', currentMember))
        .toString();
  }
}

class MeScreenViewModelBuilder
    implements Builder<MeScreenViewModel, MeScreenViewModelBuilder> {
  _$MeScreenViewModel _$v;

  MemberBuilder _currentMember;
  MemberBuilder get currentMember =>
      _$this._currentMember ??= new MemberBuilder();
  set currentMember(MemberBuilder currentMember) =>
      _$this._currentMember = currentMember;

  MeScreenViewModelBuilder();

  MeScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _currentMember = _$v.currentMember?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MeScreenViewModel;
  }

  @override
  void update(void Function(MeScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MeScreenViewModel build() {
    _$MeScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$MeScreenViewModel._(currentMember: currentMember.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currentMember';
        currentMember.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MeScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
