import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ThemeDark implements IApplicationTheme {
  static ThemeDark? _instance;
  static ThemeDark get instance {
    _instance ??= ThemeDark._init();
    return _instance!;
  }

  ThemeDark._init();

  @override
  ThemeData? theme = ThemeData.dark().copyWith();
}
