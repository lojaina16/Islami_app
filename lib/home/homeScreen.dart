import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/quran_tab.dart';
import 'package:islami/home/radio/radio_tab.dart';
import 'package:islami/home/sebha/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/Group 6.png")),
                    label: "Hadeth"),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/moshaf_blue.png")),
                    label: "Quran"),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    RadioTab(),
    TasbehTab(),
    HadethTab(),
    QuranTab(),
  ];
}
