import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stockton/data/channel_repository.dart';
import 'package:stockton/data/group_repository.dart';
import 'package:stockton/data/member_repository.dart';
import 'package:stockton/presentation/login/login_screen.dart';
import 'package:stockton/redux/app_middleware.dart';
import 'package:stockton/redux/app_reducer.dart';
import 'package:stockton/redux/app_state.dart';
import 'package:stockton/redux/authentication/auth_actions.dart';
import 'package:stockton/redux/authentication/auth_middleware.dart';
import 'package:stockton/redux/channel/channel_middleware.dart';
import 'package:stockton/redux/member/member_actions.dart';
import 'package:stockton/redux/member/member_middleware.dart';
import 'package:stockton/screens/home_screen.dart';
import 'package:stockton/screens/login_screen.dart';
import 'package:stockton/stockton_localization.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';

class StocktonApp extends StatefulWidget {
  const StocktonApp({
    Key key,
  }) : super(key: key);

  @override
  _StocktonAppState createState() => _StocktonAppState();
}

class _StocktonAppState extends State<StocktonApp> {
  Store<AppState> store;
  static final _navigatorKey = GlobalKey<NavigatorState>();
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  // 需要初始化这几个数据仓库
  final memberRepo = MemberRepository(); // !!! 需要补齐这个地方
//  final channelRepository = ChannelRepository();
  final groupRepository = GroupRepository();

//  final calendarRepository = CalendarRepository();

  @override
  void initState() {
    super.initState();
    store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: createStoreMiddleware(
        groupRepository,
      )
        ..addAll(createAuthenticationMiddleware(
          memberRepo,
          _navigatorKey,
        ))
        ..addAll(createMemberMiddleware(memberRepo)),
//        ..addAll(createChannelsMiddleware(
//            channelRepository, _navigatorKey)), // !!! 添加中间件，这里只加了一部分
    );

    // 验证登录状态
    store.dispatch(VerifyAuthenticationState());

//    // 同步消息
//    _firebaseMessaging.configure(
//      onMessage: (Map<String, dynamic> message) async {
//        store.dispatch(OnPushNotificationReceivedAction(message));
//      },
//      onLaunch: (Map<String, dynamic> message) async {
//        store.dispatch(OnPushNotificationOpenAction(message));
//      },
//      onResume: (Map<String, dynamic> message) async {
//        store.dispatch(OnPushNotificationOpenAction(message));
//      },
//    );
//    _firebaseMessaging.requestNotificationPermissions(
//        const IosNotificationSettings(sound: true, badge: true, alert: true));
//    _firebaseMessaging.onIosSettingsRegistered
//        .listen((IosNotificationSettings settings) {
//      Logger.d("Settings registered: $settings");
//    });
//    _firebaseMessaging.getToken().then((String token) {
//      assert(token != null);
//      Logger.d("Push Messaging token: $token");
//      store.dispatch(UpdateUserTokenAction(token));
//    });
  }

  // Used to propagate this users current locale to our backend (which then can send localized notifications).
  _updateMemberLocale(context) {
    final localeCode = StocktonLocalizations.of(context).locale.languageCode;
    StoreProvider.of<AppState>(context)
        .dispatch(UpdateMemberLocaleAction(localeCode));
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        localizationsDelegates: localizationsDelegates,
        supportedLocales: [
          const Locale("en", "US"),
          const Locale("zh", "CN"),
        ],
        title: "Stockton App",
        navigatorKey: _navigatorKey,
        theme: AppTheme.theme,
        initialRoute: Routes.login,
        routes: {
          Routes.login: (context) {
            return LoginScreen();
          },
          Routes.home: (context) {
            _updateMemberLocale(context);
//            return MainScreen();
            return HomeScreen(_navigatorKey, null);
          }
        },
      ),
    );
  }
}
