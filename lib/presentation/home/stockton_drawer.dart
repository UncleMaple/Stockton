import 'package:flutter/material.dart';
import 'package:stockton/presentation/calendar/calendar_screen.dart';
import 'package:stockton/presentation/home/channel_list/channel_list.dart';
import 'package:stockton/presentation/home/group_list/group_list.dart';
import 'package:stockton/util/theme.dart';

enum DrawerState { CALENDAR, CHANNEL }

class StocktonDrawer extends StatefulWidget {
  @override
  _StocktonDrawerState createState() => _StocktonDrawerState();
}

class _StocktonDrawerState extends State<StocktonDrawer> {
  DrawerState _drawerState = DrawerState.CHANNEL;

  _drawerStateChange(DrawerState state) {
    setState(() {
      _drawerState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colorMintGreen,
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(255, 255, 255, 0.1), BlendMode.modulate),
            image: AssetImage("assets/graphics/visual_twist_white_petrol.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GroupList(_drawerStateChange),
            _drawerState == DrawerState.CALENDAR ? CalendarScreen() : ChannelsList()
          ],
        ),
      ),
    );
  }
}
