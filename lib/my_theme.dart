import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xffB7935F);
  static Color blackColor = Color(0xff242424);
  static Color whiteColor = Color(0xffffffff);
  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLight,
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),
  );
}
