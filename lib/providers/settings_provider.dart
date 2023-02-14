import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang='en';
  void changelocal(String newlocal){
    currentLang=newlocal;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    notifyListeners();
  }

  String getBackgroundImage() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/main_bg_light.png'
        : 'assets/images/main_bg_dark.png';
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark ? true : false;
  }
}
