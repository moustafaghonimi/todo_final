import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: colorGreen,
    primaryColor: primaryColor,
    colorScheme: ColorScheme(
      primary: primaryColor,
      onPrimary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: colorGreen,
      onBackground: Colors.white,
      surface: primaryColor,
      onSurface:colorBlack,
      secondary: colorGreen,
      onSecondary: primaryColor,
      brightness: Brightness.light,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
    subtitle1: TextStyle(
    fontSize: 20,
    color:primaryColor,
    ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: colorGreen,
    primaryColor: primaryColor,
    colorScheme: ColorScheme(
      primary: primaryColor,
      onPrimary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: colorGreen,
      onBackground: Colors.white,
      surface: primaryColor,
      onSurface: Colors.white,
      secondary: colorGreen,
      onSecondary: primaryColor,
      brightness: Brightness.light,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      iconSize: 25,

    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        fontSize: 20,
        color:primaryColor,
      ),
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );}
