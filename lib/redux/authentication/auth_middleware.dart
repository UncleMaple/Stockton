import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:stockton/data/member_repository.dart';
import 'package:stockton/redux/app_actions.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/util/config.dart';
import 'package:stockton/util/local_storage.dart';
import 'package:stockton/util/logger.dart';
import 'package:stockton/util/routes.dart';

List<Middleware<AppState>> createAuthenticationMiddleware(
    MemberRepository memberRepository, GlobalKey<NavigatorState> navigatorKey) { // !!! GlobalKey不理解, 用于获取全局状态
  return [
    TypedMiddleware<AppState, VerifyAuthenticationState>(
        _verifyAuthState(memberRepository, navigatorKey)),
    TypedMiddleware<AppState, LogIn>(
        _authLogin(memberRepository, navigatorKey)),
    TypedMiddleware<AppState, LogOutAction>(
        _authLogout(memberRepository, navigatorKey)),
  ];
}

/// 登出认证
void Function(Store<AppState> store, LogOutAction action, NextDispatcher next) _authLogout(MemberRepository memberRepository, GlobalKey<NavigatorState> navigatorKey) {
  return (store, action, next) async {
    next(action);
    try{
      await memberRepository.logOut();
//      !!! 取消所有订阅，这个地方因为用不到，注释掉了
//      cancelAllSubscriptions();
      store.dispatch(OnLogoutSuccess());
    } catch(e) {
      Logger.w("Failed logout", e: e);
      store.dispatch(OnLogoutFail(e));
    }
  };
}

/// 登录认证
void Function(Store<AppState> store, LogIn action, NextDispatcher next) _authLogin(MemberRepository memberRepository, GlobalKey<NavigatorState> navigatorKey) {
  return (store, action, next) async {
    next(action);
    try{
      final member = await memberRepository.signIn(action.account, action.password);
      if (member.id == -1){
        throw Exception("ERROR_MEMBER_LOGIN");
      }
      store.dispatch(OnAuthenticated(member));
      LocalStorage.save(Config.MEMBER_TOKEN, member.token);

//      await navigatorKey.currentState.pushReplacementNamed(Routes.home); // 路由页面切换在登录界面做了
      action.completer.complete();
    } catch (e) {
      action.completer.completeError(e);
    }
  };
}

/// 验证认证状态
void Function(Store<AppState> store, VerifyAuthenticationState action, NextDispatcher next) _verifyAuthState(MemberRepository memberRepository, GlobalKey<NavigatorState> navigatorKey) {
  return (store, action, next) {
    next(action);

    memberRepository.getAuthenticationStateChange().listen((member){
      if (member == null) {
        // !!! 关闭了登录页跳转
        // navigatorKey.currentState.pushReplacementNamed(Routes.login);
      } else{
        store.dispatch(OnAuthenticated(member));
        store.dispatch(ConnectToDataSource());
      }
    });
  };
}



