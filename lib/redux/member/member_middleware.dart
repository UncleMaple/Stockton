import 'package:stockton/data/member_repository.dart';
import 'package:stockton/models/member.dart';
import 'package:redux/redux.dart';
import 'package:stockton/redux/app_actions.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/redux/member/member_actions.dart';
import 'package:stockton/util/logger.dart';

import '../stream_subscriptions.dart';

List<Middleware<AppState>> createMemberMiddleware(
  MemberRepository memberRepository,
) {
  return [
    TypedMiddleware<AppState, OnAuthenticated>(
        _listenToMember(memberRepository)),
    TypedMiddleware<AppState, SelectGroup>(_listenToMembers(memberRepository)),
    TypedMiddleware<AppState, UpdateMemberLocaleAction>(
        _updateMemberLocale(memberRepository)),
    TypedMiddleware<AppState, UpdateMemberAction>(
        _updateMember(memberRepository)),
  ];
}

// 监听登入用户的更新
void Function(
        Store<AppState> store, UpdateMemberAction action, NextDispatcher next)
    _updateMember(MemberRepository memberRepository) {
  return (store, action, next) {
    next(action);

    try {
      memberUpdateSubscription?.cancel();
      memberUpdateSubscription =
          memberRepository.getMemberStream(action.member).listen((member) {
        store.dispatch(OnMemberUpdateAction(member));
      });
    } catch (e) {
      Logger.e("Failed to listen member", e: e, s: StackTrace.current);
    }
  };
}

// 更新登入用户的语言显示
void Function(Store<AppState> store, UpdateMemberLocaleAction action,
        NextDispatcher next)
    _updateMemberLocale(MemberRepository memberRepository) {
  return (store, action, next) async {
    next(action);

    try {
      await memberRepository.updateMemberLocale(action.locale);
    } catch (e) {
      Logger.e("", e: e, s: StackTrace.current);
    }
  };
}

// 这个listener只会对匹配groupId的更新有效
// 对于加群的用户：
// - 我们存储了群里的所有用户
// - 我们也存储了用户的进群资格???
void Function(Store<AppState> store, SelectGroup action, NextDispatcher next)
    _listenToMembers(MemberRepository memberRepository) {
  return (store, action, next) {
    next(action);
    try {
//      ??? 这一块的操作还是没明白
      groupMembersSubscription?.cancel();
      groupMembersSubscription =
          memberRepository.getMembersStream(action.groupId).listen((members) {
        store.dispatch(MembersUpdateAction(members));
      });
    } catch (e) {
      Logger.e("Failed to listen to members", e: e, s: StackTrace.current);
    }
  };
}

// 接收登入用户的更新
void Function(
        Store<AppState> store, OnAuthenticated action, NextDispatcher next)
    _listenToMember(MemberRepository memberRepository) {
  return (store, action, next) {
    next(action);
    try {
      memberUpdateSubscription?.cancel();
      memberUpdateSubscription =
          memberRepository.getMemberStream(action.member.id).listen((member) {
        store.dispatch(OnMemberUpdateAction(member));
      });
    } catch (e) {
      Logger.e("Failed to listen user", e: e, s: StackTrace.current);
    }
  };
}
