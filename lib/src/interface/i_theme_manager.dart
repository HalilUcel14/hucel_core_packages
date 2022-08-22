import 'package:flutter/material.dart';

//
// Abstract ile ThemeManager için Zorunlulukları belirliyoruz.
abstract class IThemeManager {
  late ThemeData currentTheme;
  late ThemeEnum currentEnum;

  void changeTheme(ThemeEnum themes);
}

//
// Theme Ligt ve Dart için Abstract
abstract class IApplicationTheme {
  ThemeData? theme;
}

// Theme İçin Enum Seçenekleri
enum ThemeEnum { LIGHT, DARK }

/// Theme Enum Extension
/// Enum seçimine göre Theme Tipi dönüşü yapması için
extension ThemeEnumExtension on ThemeEnum {
  ThemeData generateTheme({
    required ThemeData darkTheme,
    required ThemeData lightTheme,
  }) {
    switch (this) {
      case ThemeEnum.LIGHT:
        return lightTheme;
      case ThemeEnum.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}

/// Theme Manager Class