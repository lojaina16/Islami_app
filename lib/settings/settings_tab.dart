import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:islami/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            InkWell(
              onTap: () {
                showLanguageButtomsheet();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          provider.appLanguage == "en"
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            InkWell(
              onTap: () {
                showThemeButtomsheet();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          provider.isDarkMode()
                              ? AppLocalizations.of(context)!.dark
                              : AppLocalizations.of(context)!.light,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 20)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showLanguageButtomsheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBtoomSheet());
  }

  void showThemeButtomsheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBtoomSheet());
  }
}
