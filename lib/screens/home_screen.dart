import 'package:flutter/material.dart';
import 'package:stockton/presentation/login/login_screen.dart';
import 'package:stockton/util/colors.dart';
import 'package:stockton/util/routes.dart';
import 'package:stockton/util/theme.dart';
import 'package:stockton/widgets/category_selector.dart';
import 'package:stockton/widgets/favorite_contacts.dart';
import 'package:stockton/widgets/recent_chats.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
    this.memberId,
  );

  final int memberId;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void _backToLogin() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: whiteDark,
          onPressed: _backToLogin,
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: whiteDark,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              iconSize: 30.0,
              color: whiteDark,
              onPressed: () {})
        ],
        elevation: 0.0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeArguments {
  final int memberId;

  HomeArguments(this.memberId);
}
