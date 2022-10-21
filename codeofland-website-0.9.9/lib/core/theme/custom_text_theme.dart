import 'package:flutter/material.dart';

import 'theme_light.dart';

class CustomTextTheme extends TextTheme {
  static TextStyle defaultStyle = const TextStyle(
    color: Colors.black,
  );
  static TextStyle primaryStyle = TextStyle(
    color: Colors.amber.shade700,
  );

  TextTheme get normalTheme => TextTheme(
        headline1: defaultStyle.copyWith(
          fontSize: 96,
          fontWeight: FontWeightEnum.light.value,
          letterSpacing: -1.5,
        ),
        headline2: defaultStyle.copyWith(
          fontSize: 60,
          fontWeight: FontWeightEnum.light.value,
          letterSpacing: -0.5,
        ),
        headline3: defaultStyle.copyWith(
          fontSize: 48,
          fontWeight: FontWeightEnum.regular.value,
        ),
        headline4: defaultStyle.copyWith(
          fontSize: 34,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.25,
        ),
        headline5: defaultStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeightEnum.regular.value,
        ),
        headline6: defaultStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeightEnum.medium.value,
          letterSpacing: 0.15,
        ),
        subtitle1: defaultStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.15,
        ),
        subtitle2: defaultStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeightEnum.medium.value,
          letterSpacing: 0.1,
        ),
        bodyText1: defaultStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.5,
        ),
        bodyText2: defaultStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.25,
        ),
        button: defaultStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeightEnum.medium.value,
          letterSpacing: 1.25,
        ),
        caption: defaultStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.4,
        ),
        overline: defaultStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 1.5,
        ),
      );
//
//
  TextTheme get primaryTheme => TextTheme(
        headline1: primaryStyle.copyWith(
          fontSize: 96,
          fontWeight: FontWeightEnum.light.value,
          letterSpacing: -1.5,
        ),
        headline2: primaryStyle.copyWith(
          fontSize: 60,
          fontWeight: FontWeightEnum.light.value,
          letterSpacing: -0.5,
        ),
        headline3: primaryStyle.copyWith(
          fontSize: 48,
          fontWeight: FontWeightEnum.regular.value,
        ),
        headline4: primaryStyle.copyWith(
          fontSize: 34,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.25,
        ),
        headline5: primaryStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeightEnum.regular.value,
        ),
        headline6: primaryStyle.copyWith(
          fontSize: 20,
          fontWeight: FontWeightEnum.medium.value,
          letterSpacing: 0.15,
        ),
        subtitle1: primaryStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.15,
        ),
        subtitle2: primaryStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeightEnum.medium.value,
          letterSpacing: 0.1,
        ),
        bodyText1: primaryStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.5,
        ),
        bodyText2: primaryStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.25,
        ),
        button: primaryStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeightEnum.medium.value,
          letterSpacing: 1.25,
        ),
        caption: primaryStyle.copyWith(
          fontSize: 12,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 0.4,
        ),
        overline: primaryStyle.copyWith(
          fontSize: 10,
          fontWeight: FontWeightEnum.regular.value,
          letterSpacing: 1.5,
        ),
      );
}
