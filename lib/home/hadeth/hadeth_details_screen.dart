import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  HadethDetails({super.key});

  static const String routeName = "Hadeth Name";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              "assets/images/bg.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              "assets/images/background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "${args.title}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.05,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          decoration: BoxDecoration(
            color: provider.isDarkMode()
                ? MyTheme.primaryDark
                : MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                "${args.content[index]}",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              );
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}
