import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/member/member_actions.dart';

final memberReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, MembersUpdateAction>(_onMembersUpdate),
  TypedReducer<AppState, OnMemberUpdateAction>(_onMemberUpdate),
];

AppState _onMemberUpdate(AppState state, OnMemberUpdateAction action) {
  return state.rebuild((a) => a
  // Update the app member
    ..member = action.member.toBuilder()
  // Update the member in the groupMembers
    ..groupMembers.removeWhere((m) => m.id == action.member.id)
    ..groupMembers.add(action.member));
}

AppState _onMembersUpdate(AppState state, MembersUpdateAction action) {
  return state.rebuild((a) => a..groupMembers = ListBuilder(action.members));
}
