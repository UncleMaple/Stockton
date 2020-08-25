import 'package:flutter/material.dart';

class Routes {
  static final home = "/";
  static final login = "/login";
  static final channelNew = "/channel/new";
  static final channelInvite = "/channel/invite";
  static final eventNew = "/event/new";
  static final image = "/image";
  static final imagePinch = "/image/pinch";
  static final imagePicker = "/image/picker";
  static final reaction = "/reaction";
  static final member = "/member";
  static final settings = "/settings";
}

class FadePageRoute<T> extends MaterialPageRoute<T> {
  FadePageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // !!!这块之后需要改掉！先暂时这么用着
    // flutter升级去掉了settings.isInitialRoute
    // 具体升级替换方案参考 https://flutter.dev/docs/release/breaking-changes/route-navigator-refactoring
    if (settings.name == '/' || settings.name == '/login') {
      return child;
    }

    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
