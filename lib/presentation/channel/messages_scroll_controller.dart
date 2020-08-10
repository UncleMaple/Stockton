import 'package:flutter/material.dart';

class MessagesScrollController extends InheritedWidget {
  final ScrollController scrollController;

  const MessagesScrollController({
    Key key,
    @required Widget child,
    @required this.scrollController,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

//   !!! 之前的方法【inheritFromWidgetOfExactType(MessagesScrollController)】flutter 升级后取消了，有了替代方法
//  static MessagesScrollController of(BuildContext context) => context.dependOnInheritedWidgetOfExactType(aspect: MessagesScrollController);

  static MessagesScrollController of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(MessagesScrollController);
}
