import 'package:flutter/material.dart';

class myTheme{
  static final myTheme instance = myTheme();
  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.light(background: Colors.black12.withOpacity(0.05)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFDB3022),
      unselectedItemColor: Colors.black,
    ),
    badgeTheme: BadgeThemeData(
      backgroundColor: Colors.black,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 22, color: Colors.orange),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
      labelLarge: TextStyle(fontSize: 16, color: Colors.black54),
      bodyMedium: TextStyle(fontSize: 25, color: Colors.black,fontWeight: FontWeight.bold),
      labelSmall: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );

  ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.dark(background: Colors.white12.withOpacity(0.05)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFDB3022),
      unselectedItemColor: Colors.white,
    ),
    badgeTheme: BadgeThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 22, color: Colors.orange),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
      labelLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
      labelSmall: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}