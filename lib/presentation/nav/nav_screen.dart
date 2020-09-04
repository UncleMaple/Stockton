import 'package:flutter/material.dart';
import 'package:stockton/models/member.dart';
import 'package:stockton/presentation/common/responsive.dart';
import 'package:stockton/presentation/me/me_screen.dart';
import 'package:stockton/presentation/nav/custom_app_bar.dart';
import 'package:stockton/presentation/nav/custom_tab_bar.dart';
import 'package:stockton/screens/home_screen.dart';
import 'package:stockton/util/theme.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(backgroundColor: AppTheme.colorShallowBlack),
    MeScreen(),
  ];

  final List<IconData> _icons = const [
    Icons.chat,
    Icons.explore,
    Icons.person,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // return ;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
          appBar: PreferredSize(
            child: CustomAppBar(
              currentMember: Member.init(),
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
            preferredSize: Size.fromHeight(48.0*2),
          ),
          body: TabBarView(
            children: _screens,
            // physics: NeverScrollableScrollPhysics(),
          )
      ),
    );
  }
}
