import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ColorConstant {
  static ColorConstant? _instance;
  static ColorConstant get instance {
    _instance ??= ColorConstant._init();
    return _instance!;
  }

  ColorConstant._init();

  static Color backgroundBlueColor = '1877f2'.color;
  static Color backgroundWhiteColor = Colors.white;
}
