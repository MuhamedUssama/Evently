import 'package:evently/core/models/language_model.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  String languageCode = 'en';
  List<LanguageModel> languages = [
    LanguageModel(name: 'English', code: 'en'),
    LanguageModel(name: 'العربية', code: 'ar'),
  ];

  void changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  void changeLanguage(String language) {
    languageCode = language;
    notifyListeners();
  }
}
