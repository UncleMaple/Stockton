import 'package:flutter/material.dart';
import 'package:stockton/util/colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: primaryBlack,
      secondaryHeaderColor: primaryBlack[400],
      accentColor: Color(0xFF6699FF),
      cursorColor: Colors.blueAccent,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        // ignore: deprecated_member_use
        display2: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 45.0,
          color: Colors.white54,
        ),
        button: TextStyle(
          fontFamily: 'OpenSans',
        ),
        // ignore: deprecated_member_use
        subhead: TextStyle(fontFamily: 'NotoSans'),
        // ignore: deprecated_member_use
        body1: TextStyle(fontFamily: 'NotoSans'),
      ),
    );
  }
}
