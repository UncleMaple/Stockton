import 'package:flutter/material.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/presentation/common/responsive.dart';
import 'package:stockton/presentation/login/login_screen.dart';
import 'package:stockton/presentation/nav/custom_tab_bar.dart';
import 'package:stockton/util/colors.dart';
import 'package:stockton/util/theme.dart';

class CustomAppBar extends StatelessWidget {
  final Member currentMember;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isTopIndicator;

  const CustomAppBar({
    Key key,
    @required this.currentMember,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isTopIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.colorDeepBlack,
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 30.0,
        color: whiteDark,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }),
          );
        },
      ),
      title: Text(
        "Stockton",
        style: TextStyle(
          fontSize: 27.0,
          fontWeight: FontWeight.bold,
          color: whiteDark,
        ),
      ),
      centerTitle: false,
      titleSpacing: 1.1,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          iconSize: 30.0,
          color: whiteDark,
          onPressed: () {
            print("search clicked");
          },
        ),
      ],
      bottom: PreferredSize(
          child: CustomTabBar(
              icons: icons, selectedIndex: selectedIndex, onTap: onTap),
          preferredSize: Size.fromHeight(48.0)),
    );
  }
}
