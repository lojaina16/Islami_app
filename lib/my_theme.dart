import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xffB7935F);
  static Color primaryDark = Color(0xff141A2E);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xffffffff);
  static Color yellowColor = Color(0xffFACC1D);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLight,
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
  );

  static ThemeData darkMode = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
      titleMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: yellowColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDark,
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
    ),
  );
}
