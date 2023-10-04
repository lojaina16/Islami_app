import 'package:flutter/material.dart';
import 'package:islami/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class IconBtn extends StatelessWidget {
  IconData icon;

  IconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 50,
          color: provider.isDarkMode()
              ? MyTheme.yellowColor
              : Theme.of(context).primaryColor,
        ));
  }
}
