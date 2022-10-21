import 'package:codeofland_website/core/theme/custom_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

import '../widget/custom_elevated_button.dart';

enum FontWeightEnum {
  light,
  regular,
  medium,
  large,
  bold,
  ;

  FontWeight get value {
    switch (this) {
      case FontWeightEnum.light:
        return FontWeight.w300;
      case FontWeightEnum.regular:
        return FontWeight.w400;
      case FontWeightEnum.medium:
        return FontWeight.w500;
      case FontWeightEnum.large:
        return FontWeight.w600;
      case FontWeightEnum.bold:
        return FontWeight.w700;
    }
  }
}

class ThemeLight implements IApplicationTheme {
  static ThemeLight? _instance;
  static ThemeLight get instance {
    _instance ??= ThemeLight._init();
    return _instance!;
  }

  ThemeLight._init();

  static TextStyle defaultStyle = const TextStyle(
    color: Colors.black,
  );
  static TextStyle primaryStyle = TextStyle(
    color: Colors.amber.shade700,
  );

  @override
  ThemeData? theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.amber,
      brightness: Brightness.light,
    ),
    primaryColor: Colors.amber.shade700,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: CustomButtonStyle(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        alignment: Alignment.center,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(8.0),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    useMaterial3: true,
    textTheme: CustomTextTheme().normalTheme,
    primaryTextTheme: CustomTextTheme().primaryTheme,
    // textTheme: TextTheme(
    //   headline1: defaultStyle.copyWith(
    //     fontSize: 96,
    //     fontWeight: FontWeightEnum.light.value,
    //     letterSpacing: -1.5,
    //   ),
    //   headline2: defaultStyle.copyWith(
    //     fontSize: 60,
    //     fontWeight: FontWeightEnum.light.value,
    //     letterSpacing: -0.5,
    //   ),
    //   headline3: defaultStyle.copyWith(
    //     fontSize: 48,
    //     fontWeight: FontWeightEnum.regular.value,
    //   ),
    //   headline4: defaultStyle.copyWith(
    //     fontSize: 34,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.25,
    //   ),
    //   headline5: defaultStyle.copyWith(
    //     fontSize: 24,
    //     fontWeight: FontWeightEnum.regular.value,
    //   ),
    //   headline6: defaultStyle.copyWith(
    //     fontSize: 20,
    //     fontWeight: FontWeightEnum.medium.value,
    //     letterSpacing: 0.15,
    //   ),
    //   subtitle1: defaultStyle.copyWith(
    //     fontSize: 16,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.15,
    //   ),
    //   subtitle2: defaultStyle.copyWith(
    //     fontSize: 14,
    //     fontWeight: FontWeightEnum.medium.value,
    //     letterSpacing: 0.1,
    //   ),
    //   bodyText1: defaultStyle.copyWith(
    //     fontSize: 16,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.5,
    //   ),
    //   bodyText2: defaultStyle.copyWith(
    //     fontSize: 14,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.25,
    //   ),
    //   button: defaultStyle.copyWith(
    //     fontSize: 14,
    //     fontWeight: FontWeightEnum.medium.value,
    //     letterSpacing: 1.25,
    //   ),
    //   caption: defaultStyle.copyWith(
    //     fontSize: 12,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.4,
    //   ),
    //   overline: defaultStyle.copyWith(
    //     fontSize: 10,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 1.5,
    //   ),
    // ),
    // primaryTextTheme: TextTheme(
    //   headline1: primaryStyle.copyWith(
    //     fontSize: 96,
    //     fontWeight: FontWeightEnum.light.value,
    //     letterSpacing: -1.5,
    //   ),
    //   headline2: primaryStyle.copyWith(
    //     fontSize: 60,
    //     fontWeight: FontWeightEnum.light.value,
    //     letterSpacing: -0.5,
    //   ),
    //   headline3: primaryStyle.copyWith(
    //     fontSize: 48,
    //     fontWeight: FontWeightEnum.regular.value,
    //   ),
    //   headline4: primaryStyle.copyWith(
    //     fontSize: 34,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.25,
    //   ),
    //   headline5: primaryStyle.copyWith(
    //     fontSize: 24,
    //     fontWeight: FontWeightEnum.regular.value,
    //   ),
    //   headline6: primaryStyle.copyWith(
    //     fontSize: 20,
    //     fontWeight: FontWeightEnum.medium.value,
    //     letterSpacing: 0.15,
    //   ),
    //   subtitle1: primaryStyle.copyWith(
    //     fontSize: 16,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.15,
    //   ),
    //   subtitle2: primaryStyle.copyWith(
    //     fontSize: 14,
    //     fontWeight: FontWeightEnum.medium.value,
    //     letterSpacing: 0.1,
    //   ),
    //   bodyText1: primaryStyle.copyWith(
    //     fontSize: 16,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.5,
    //   ),
    //   bodyText2: primaryStyle.copyWith(
    //     fontSize: 14,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.25,
    //   ),
    //   button: primaryStyle.copyWith(
    //     fontSize: 14,
    //     fontWeight: FontWeightEnum.medium.value,
    //     letterSpacing: 1.25,
    //   ),
    //   caption: primaryStyle.copyWith(
    //     fontSize: 12,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 0.4,
    //   ),
    //   overline: primaryStyle.copyWith(
    //     fontSize: 10,
    //     fontWeight: FontWeightEnum.regular.value,
    //     letterSpacing: 1.5,
    //   ),
    // ),
  );
}
