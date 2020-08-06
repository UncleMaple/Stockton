import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:stockton/models/channel_state.dart';
import 'package:stockton/models/group.dart';
import 'package:stockton/redux/app_actions.dart';
import 'package:stockton/redux/authentication/auth_reducer.dart';

import 'app_state.dart';
import 'member/member_reducer.dart';


final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, OnGroupsLoaded>(_onGroupsLoaded),
  TypedReducer<AppState, SelectGroup>(_onSelectGroup),
  ...authReducers,
  ...memberReducers,
//  ...calendarReducer,
//  ...channelReducers,
//  ...messageReducers,
//  ...pushReducers,
//  ...uiReducers,
]);

AppState _onGroupsLoaded(AppState state, OnGroupsLoaded action) {
  if (action.groups.isNotEmpty) {
    final selectedGroup = state.selectedGroupId;
    final Map<String, Group> groups = Map.fromIterable(
      action.groups,
      key: (item) => item.id,
      value: (item) => item,
    );
    return state.rebuild((a) => a
      ..selectedGroupId = selectedGroup
      ..groups = MapBuilder(groups));
  } else {
    return state.rebuild((a) => a
      ..channelState = ChannelState.init().toBuilder()
      ..groups = MapBuilder());
  }
}

AppState _onSelectGroup(AppState state, SelectGroup action) {
  return state.rebuild((a) => a..selectedGroupId = action.groupId);
}
