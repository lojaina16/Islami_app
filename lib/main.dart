import 'package:flutter/material.dart';
import 'package:islami/home/homeScreen.dart';
import 'package:islami/home/quran/sura_details_screen.dart';
import 'package:islami/my_theme.dart';

import 'home/hadeth/hadeth_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      theme: MyTheme.lightMode,
    );
  }
}
