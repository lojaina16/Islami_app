import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.system;
  SharedPreferences? pref;
  String themeKey = "theme";
  String languageKey = "language";

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    } else {
      appLanguage = newLanguage;
      notifyListeners();
      saveLanguage(newLanguage);
    }
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    } else {
      appTheme = newMode;
      notifyListeners();
      saveTheme(newMode);
    }
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }

  String? getTheme() {
    return pref!.getString(themeKey);
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String themeValue = (themeMode == ThemeMode.light ? "light" : "dark");
    await pref!.setString(themeKey, themeValue);
  }

  Future<void> loadSettingConfig() async {
    pref = await SharedPreferences.getInstance();
    String? themeMode = getTheme();
    String? language = getLanguage();
    if (language != null) {
      appLanguage = language;
    }

    if (themeMode != null) {
      appTheme = themeMode == "light" ? ThemeMode.light : ThemeMode.dark;
    }
  }

  String? getLanguage() {
    return pref!.getString(languageKey);
  }

  saveLanguage(String newLanguage) async {
    await pref!.setString(languageKey, newLanguage);
  }
}
