import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:provider/provider.dart';

//
// Provider için theme izlemesine yarayan extension code Context ile çalışır
//
extension ThemeContextExtension on BuildContext {
  ThemeData get themeProvider => watch<ThemeManager>().currentTheme;
  ThemeManager get themeManager => ThemeManager.instance;
}

class ThemeManager extends ChangeNotifier implements IThemeManager {
  static ThemeManager? _instance;
  static ThemeManager get instance {
    _instance ??= ThemeManager._init();
    return _instance!;
  }

  static late ThemeData? themeDataDark;
  static late ThemeData? themeDataLight;

  ThemeManager._init();

  @override
  ThemeEnum currentEnum = ThemeEnum.LIGHT;

  @override
  ThemeData currentTheme = ThemeEnum.LIGHT.generateTheme(
    darkTheme: themeDataDark ?? ThemeData.dark(),
    lightTheme: themeDataLight ?? ThemeData.light(),
  );

  @override
  void changeTheme(ThemeEnum themes) {
    if (themes != currentEnum) {
      currentTheme = themes.generateTheme(
        darkTheme: themeDataDark ?? ThemeData.dark(),
        lightTheme: themeDataLight ?? ThemeData.light(),
      );
      currentEnum = themes;

      notifyListeners();
    }
    return;
  }
}
