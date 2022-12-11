import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: colorGold,
    colorScheme: ColorScheme(
      primary: colorGold,
      onPrimary: colorBlack,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.transparent,
      onBackground: colorBlack,
      surface: colorGold,
      onSurface: Colors.brown,
      secondary: Colors.white,
      onSecondary: colorGold,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorGold,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
    subtitle1: TextStyle(
    fontSize: 30,
      fontWeight: FontWeight.w400,
    color: colorBlack,
    ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: colorBlack,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryDarkColor,
    colorScheme: ColorScheme(
      primary: primaryDarkColor,
      onPrimary: onprimaryDarkColor,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.transparent,
      onBackground: onprimaryDarkColor,
      surface: primaryDarkColor,
      onSurface: Colors.brown,
      secondary: Colors.brown,
      onSecondary: Colors.white,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDarkColor,
      selectedItemColor: onprimaryDarkColor,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: onprimaryDarkColor,
        ),
        subtitle1: TextStyle(
          fontSize: 20,
          color: onprimaryDarkColor,
        )),
  );
}
