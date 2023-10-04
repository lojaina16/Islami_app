import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  static const String routeName = "Sura Name";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFiles(args.index);
    }
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
            "${args.suraName}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: verses.length == 0
            ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ))
            : Container(
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
                "${verses[index]}{${index + 1}}",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              );
            },
            itemCount: verses.length,
          ),
        ),
      ),
    ]);
  }

  void loadFiles(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs({required this.suraName, required this.index});
}
