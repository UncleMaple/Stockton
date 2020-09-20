import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:stockton/screens/home_screen.dart';
import 'package:stockton/stockton_app.dart';
import 'package:stockton/util/logger.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

void main() {
  configureLogger();
//  runApp(MyApp());
  runApp(StocktonApp());
}

//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        title: 'stockton',
//        theme: AppTheme.theme,
//        // theme: ThemeData.dark(), // 夜间模式
//        debugShowCheckedModeBanner: false,
//
//        // 国际化
//        localizationsDelegates: [
//          // 本地化的代理类
//          GlobalMaterialLocalizations.delegate,
//          GlobalWidgetsLocalizations.delegate,
//        ],
//        supportedLocales: [
//          const Locale('en', 'US'), // 美式英语
//          const Locale('zh', 'CN'), // 中文简体
//        ],
//
//        // 路由相关
//        initialRoute: Routes.home,
//        routes: {
//          Routes.login: (context) {
//            return LoginScreen();
//          },
//          Routes.home: (context) {
//            return HomeScreen(key, null);
//          }
//        },
//        // 如果访问的路由页需要登录，但当前未登录，则直接返回登录路由，引导用户登录
//        // 其他情况则正常打开路由
//        onGenerateRoute: (RouteSettings settings) {
//          String routeName = settings.name;
//          if (routeName == Routes.home) {
//            final HomeArguments args = settings.arguments;
//
//            return MaterialPageRoute(
//              builder: (context) {
//                return HomeScreen(key, args.memberId);
//              },
//            );
//          } else {
//            // 返回登录页
//            return MaterialPageRoute(
//              builder: (context) {
//                return LoginScreen();
//              },
//            );
//          }
//        });
//  }
//}
