import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stockton/models/in_app_notification.dart';
import 'package:stockton/presentation/channel/channel_screen.dart';
import 'package:stockton/presentation/home/home_app_bar.dart';
import 'package:stockton/presentation/home/stockton_drawer.dart';
import 'package:stockton/presentation/in_app_notification/in_app_notification_view_model.dart';
import 'package:stockton/presentation/in_app_notification/in_app_notification_widget.dart';
import 'package:stockton/redux/app_state.dart';

class HomeScreen extends StatefulWidget {
  final ValueNotifier<bool> sideOpenController;

  const HomeScreen({
    Key key,
    @required this.sideOpenController,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          key: _scaffoldKey,
          appBar: HomeAppBar(
            scaffoldKey: _scaffoldKey,
            sideOpenController: widget.sideOpenController,
          ),
          body: ChannelScreen(),
          drawer: StocktonDrawer(),
        ),
        StoreConnector<AppState, InAppNotificationViewModel>(
          converter: InAppNotificationViewModel.fromStore,
          builder: (BuildContext context, InAppNotificationViewModel vm) {
            return vm.inAppNotification != null
                ? InAppNotificationWidget(vm)
                : Container();
          },
        )
      ],
    );
  }
}
