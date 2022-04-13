import 'package:flutter/material.dart';

enum AppThemes {
  light,
  dark,
}

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  AppThemes _currentThemeEnum = AppThemes.light;

  AppThemes get currentThemeEnum => _currentThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.light) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currentThemeEnum == AppThemes.light) {
      _currentTheme = ThemeData.dark();
      _currentThemeEnum = AppThemes.dark;
    } else {
      _currentTheme = ThemeData.light();
      _currentThemeEnum = AppThemes.light;
    }
    notifyListeners();
  }
}
