import 'package:redux/redux.dart';
import 'package:stockton/data/group_repository.dart';
import 'package:stockton/redux/app_actions.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/channel/channel_actions.dart';
import 'package:stockton/redux/stream_subscriptions.dart';
import 'package:stockton/util/logger.dart';

List<Middleware<AppState>> createStoreMiddleware(
    GroupRepository groupRepository) {
  return [
    LoggerMiddleware(),
    TypedMiddleware<AppState, SelectGroup>(_selectGroup()),
    TypedMiddleware<AppState, ConnectToDataSource>(_loadData(groupRepository)),
  ];
}

void Function(
        Store<AppState> store, ConnectToDataSource action, NextDispatcher next)
    _loadData(
  groupRepository,
) {
  return (store, action, next) {
    next(action);

    try {
      groupsSubscription?.cancel();
      groupsSubscription =
          groupRepository.getGroupStream(store.state.member.id).listen((group) {
        store.dispatch(OnGroupsLoaded(group.first.id));
      });
    } catch (e) {
      Logger.e("Failed to subscribe to groups", e: e, s: StackTrace.current);
    }
  };
}

void Function(Store<AppState> store, SelectGroup action, NextDispatcher next)
    _selectGroup() {
  return (store, action, next) {
    next(action);

    store.dispatch(LoadChannels(
      action.groupId,
    ));
  };
}
