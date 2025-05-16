import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }
}
