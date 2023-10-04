import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  String txt = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        provider.isDarkMode()
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.asset("assets/images/Group 12.png")),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.asset("assets/images/Group 21.png")),
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.tasbeh_number,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? MyTheme.primaryDark
                      : MyTheme.primaryLight,
                  borderRadius: BorderRadius.circular(20)),
              child: Text("$counter",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20))),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: provider.isDarkMode()
                      ? MyTheme.yellowColor
                      : Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                counter++;
                if (counter == 34) {
                  if (txt == "سبحان الله") {
                    txt = "الحمد لله";
                    counter = 0;
                  } else if (txt == "الحمد لله") {
                    counter = 0;
                    txt = "الله اكبر";
                  } else if (txt == "الله اكبر") {
                    counter = 0;
                    txt = "سبحان الله";
                  }
                  counter = 0;
                }
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(txt,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              )),
        )
      ],
    );
  }
}
