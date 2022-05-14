import 'package:flutter/material.dart';

class MyTextTheme {
  static MyTextTheme? _instance;

  static MyTextTheme get instance {
    _instance ??= MyTextTheme._init();
    return _instance!;
  }

  MyTextTheme._init();

  //
  Color kTextColor = const Color(0xFF757575);
  String defaultFontFamily = "Muli";
//
  TextTheme theme({
    Color? textColor,
    String? fontFamily,
  }) =>
      TextTheme(
        headline1: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        headline2: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        headline3: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 48,
          fontWeight: FontWeight.w400,
          //letterSpacing: -1.5,
        ),
        headline4: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headline5: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          //letterSpacing: 0.25,
        ),
        headline6: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        subtitle1: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyText1: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyText2: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        button: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        caption: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        overline: TextStyle(
          color: textColor ?? kTextColor,
          fontFamily: fontFamily ?? defaultFontFamily,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      );
}
