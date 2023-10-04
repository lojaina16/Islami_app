import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/homeScreen.dart';
import 'package:islami/home/quran/sura_details_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import 'home/hadeth/hadeth_details_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var provider = AppConfigProvider();
  await provider.loadSettingConfig();
  runApp(ChangeNotifierProvider(create: (_) => provider, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      themeMode: provider.appTheme,
    );
  }
}
