import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:redux/redux.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/member/member_actions.dart';

part 'member_screen_view_model.g.dart';

abstract class MemberScreenViewModel
    implements Built<MemberScreenViewModel, MemberScreenViewModelBuilder> {
  Member get member;

  bool get isMe;

  @BuiltValueField(compare: false)
  void Function(Member member, Completer completer) get submit;

  MemberScreenViewModel._();

  factory MemberScreenViewModel(
          [void Function(MemberScreenViewModelBuilder) updates]) =
      _$MemberScreenViewModel;

  static fromStore(int memberId) {
    return (Store<AppState> store) {
      return MemberScreenViewModel((m) => m
        ..member = _getMember(store, memberId)
        ..isMe = memberId == store.state.member.id
        ..submit = (member, completer) =>
            store.dispatch(UpdateMemberAction(member, completer)));
    };
  }

  static MemberBuilder _getMember(Store<AppState> store, int memberId) {
    return store.state.groupMembers
        .firstWhere((member) => member.id == memberId)
        .toBuilder();
  }
}
