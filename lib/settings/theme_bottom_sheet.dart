import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBtoomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode()
                ? selectedItemWidget(
                    context, AppLocalizations.of(context)!.dark)
                : unselectedItemWidget(
                    context, AppLocalizations.of(context)!.dark)),
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? selectedItemWidget(
                    context, AppLocalizations.of(context)!.light)
                : unselectedItemWidget(
                    context, AppLocalizations.of(context)!.light)),
      ],
    );
  }

  Widget selectedItemWidget(BuildContext context, String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          Icon(Icons.check, size: 30, color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }

  Widget unselectedItemWidget(BuildContext context, String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(txt, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
