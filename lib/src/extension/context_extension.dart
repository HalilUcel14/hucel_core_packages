import 'dart:io';

import 'package:flutter/material.dart';

import '../../hucel_core.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Color get backgroundColor => theme.backgroundColor;
  TextTheme get primaryTextTheme => theme.primaryTextTheme;
  ColorScheme get colorSheme => theme.colorScheme;
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  //
  double get width => size.width;
  double get height => size.height;
  //
  double get longSize => width > height ? width : height;
  double get shortSize => width < height ? width : height;

  double dynamicShortSize(double value) => shortSize * value;
  double dynamicLongSize(double value) => longSize * value;
  //
  double dynamicHeight(double value) => height * value;
  double dynamicWidth(double value) => width * value;
  //
  double get heightXS => height * 0.01;
  double get heightS => height * 0.02;
  double get heightN => height * 0.03;
  double get heightM => height * 0.04;
  double get heightL => height * 0.06;
  double get heightXL => height * 0.08;
  double get heightXXL => height * 0.1;
  //
  double get widthXS => width * 0.01;
  double get widthS => width * 0.02;
  double get widthN => width * 0.03;
  double get widthM => width * 0.04;
  double get widthL => width * 0.06;
  double get widthXL => width * 0.08;
  double get widthXXL => width * 0.1;
  //
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;
  Brightness get appBrightness => mediaQuery.platformBrightness;
}

extension DeviceOSExtension on BuildContext {
  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;
  bool get isWindows => Platform.isWindows;
  bool get isLinux => Platform.isLinux;
  bool get isMacOS => Platform.isMacOS;
  bool get isMobile => isAndroid || isIOS;
  bool get isDesktopWeb => isWindows || isLinux || isMacOS;
}

extension OrientationExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension ColorExtension on BuildContext {
  MaterialColor get randomColor => Colors.primaries[17.randomValue];
}

// Device Screen Type By Width(300-600-900)
// Values from https://flutter.dev/docs/development/ui/layout/building-adaptive-apps
extension ContextDeviceTypeExtension on BuildContext {
  bool get isSmallScreen =>
      width < ResponsivityConstants.instance.smallScreenSize ? true : false;
  bool get isNormalyScreen =>
      width >= ResponsivityConstants.instance.smallScreenSize &&
              width < ResponsivityConstants.instance.mediumScreenSize
          ? true
          : false;
  bool get isMediumScreen =>
      width >= ResponsivityConstants.instance.mediumScreenSize &&
              width < ResponsivityConstants.instance.largeScreenSize
          ? true
          : false;
  bool get isLargeScreen =>
      width >= ResponsivityConstants.instance.largeScreenSize ? true : false;
}

extension DurationExtension on BuildContext {
  Duration get durationXS => const Duration(milliseconds: 200);
  Duration get durationS => const Duration(milliseconds: 300);
  Duration get durationM => const Duration(milliseconds: 500);
  Duration get durationL => const Duration(milliseconds: 750);
  Duration get durationXL => const Duration(seconds: 1);
  Duration get durationXXL => const Duration(seconds: 2);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get padAllXS => EdgeInsets.all(heightXS);
  EdgeInsets get padAllS => EdgeInsets.all(heightS);
  EdgeInsets get padAllN => EdgeInsets.all(heightN);
  EdgeInsets get padAllM => EdgeInsets.all(heightM);
  EdgeInsets get padAllL => EdgeInsets.all(heightL);
  EdgeInsets get padAllXL => EdgeInsets.all(heightXL);
  EdgeInsets get padAllXXL => EdgeInsets.all(heightXXL);
  //
  EdgeInsets get padHorizontalXS => EdgeInsets.symmetric(horizontal: heightXS);
  EdgeInsets get padHorizontalS => EdgeInsets.symmetric(horizontal: heightS);
  EdgeInsets get padHorizontalN => EdgeInsets.symmetric(horizontal: heightN);
  EdgeInsets get padHorizontalM => EdgeInsets.symmetric(horizontal: heightM);
  EdgeInsets get padHorizontalL => EdgeInsets.symmetric(horizontal: heightL);
  EdgeInsets get padHorizontalXL => EdgeInsets.symmetric(horizontal: heightXL);
  EdgeInsets get padHorizontalXXL =>
      EdgeInsets.symmetric(horizontal: heightXXL);
  //
  EdgeInsets get padVerticalXS => EdgeInsets.symmetric(vertical: heightXS);
  EdgeInsets get padVerticalS => EdgeInsets.symmetric(vertical: heightS);
  EdgeInsets get padVerticalN => EdgeInsets.symmetric(vertical: heightN);
  EdgeInsets get padVerticalM => EdgeInsets.symmetric(vertical: heightM);
  EdgeInsets get padVerticalL => EdgeInsets.symmetric(vertical: heightL);
  EdgeInsets get padVerticalXL => EdgeInsets.symmetric(vertical: heightXL);
  EdgeInsets get padVerticalXXL => EdgeInsets.symmetric(vertical: heightXXL);
}

extension SizedBoxExtension on BuildContext {
  Widget get emptySizedBoxWidthXS =>
      SpaceSizedWidhtBox(context: this, width: widthXS);
  Widget get emptySizedBoxWidthS =>
      SpaceSizedWidhtBox(context: this, width: widthS);
  Widget get emptySizedBoxWidthN =>
      SpaceSizedWidhtBox(context: this, width: widthN);
  Widget get emptySizedBoxWidthM =>
      SpaceSizedWidhtBox(context: this, width: widthM);
  Widget get emptySizedBoxWidthL =>
      SpaceSizedWidhtBox(context: this, width: widthL);
  Widget get emptySizedBoxWidthXL =>
      SpaceSizedWidhtBox(context: this, width: widthXL);
  Widget get emptySizedBoxWidthXXL =>
      SpaceSizedWidhtBox(context: this, width: widthXXL);
  //
  Widget get emptySizedBoxHeightXS =>
      SpaceSizedHeightBox(context: this, height: heightXS);
  Widget get emptySizedBoxHeightS =>
      SpaceSizedHeightBox(context: this, height: heightS);
  Widget get emptySizedBoxHeightN =>
      SpaceSizedHeightBox(context: this, height: heightN);
  Widget get emptySizedBoxHeightM =>
      SpaceSizedHeightBox(context: this, height: heightM);
  Widget get emptySizedBoxHeightL =>
      SpaceSizedHeightBox(context: this, height: heightL);
  Widget get emptySizedBoxHeightXL =>
      SpaceSizedHeightBox(context: this, height: heightXL);
  Widget get emptySizedBoxHeightXXL =>
      SpaceSizedHeightBox(context: this, height: heightXXL);
}

extension RadiusExtension on BuildContext {
  Radius get radiusXS => Radius.circular(widthXS);
  Radius get radiusS => Radius.circular(widthS);
  Radius get radiusN => Radius.circular(widthN);
  Radius get radiusM => Radius.circular(widthM);
  Radius get radiusL => Radius.circular(widthL);
  Radius get radiusXL => Radius.circular(widthXL);
  Radius get radiusXXL => Radius.circular(widthXXL);
}

extension BorderExtension on BuildContext {
  BorderRadius get borderRadiusXS => BorderRadius.all(Radius.circular(widthXS));
  BorderRadius get borderRadiusS => BorderRadius.all(Radius.circular(widthS));
  BorderRadius get borderRadiusN => BorderRadius.all(Radius.circular(widthN));
  BorderRadius get borderRadiusM => BorderRadius.all(Radius.circular(widthM));
  BorderRadius get borderRadiusL => BorderRadius.all(Radius.circular(widthL));
  BorderRadius get borderRadiusXL => BorderRadius.all(Radius.circular(widthXL));
  BorderRadius get borderRadiusXXL =>
      BorderRadius.all(Radius.circular(widthXXL));
  //

}

extension NavigationExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);

  Future<T?> pop<T>([T? data]) async {
    await navigation.maybePop(data);
    return null;
  }

  Future<T?> pushNamed<T>(String path, {Object? data}) async {
    return await navigation.pushNamed<T>(path, arguments: data);
  }

  Future<T?> pushNameAndRemoveUntil<T>(String path, {Object? data}) async {
    return await navigation.pushNamedAndRemoveUntil(path, (route) => false,
        arguments: data);
  }

  Future<T?> push<T>(Widget page,
      {Object? extra, SlideType type = SlideType.defauld}) async {
    return await navigation
        .push(type.route(page, RouteSettings(arguments: extra)));
  }
}

extension SharedContextExtension on BuildContext {
  SharedManager get sharedManager => SharedManager.instance;
  //
  String get _isOnboardShowed => '/OnboardShowTime';
  //
  bool get getOnboardFirstTimeShowed =>
      sharedManager.getBoolPreferences(_isOnboardShowed);
  Future<void> get setOnboardFirstTimeShowed =>
      sharedManager.setBoolValue(_isOnboardShowed, true);
}

extension SnackbarContextExtension on BuildContext {
  ScaffoldFeatureController snackbar({
    required List<String> errorList,
    Key? snackbarKey,
    Key? mainBodyKey,
    double snackbarElevations = 0.0,
    SnackBarBehavior? snackBarBehavior = SnackBarBehavior.floating,
    SnackBarAction? snackbarAction,
    Animation<double>? snackbarAnimation,
    Clip snackbarClipBehavior = Clip.hardEdge,
    EdgeInsetsGeometry? snackbarMargin,
    void Function()? snackbaronVisible,
    EdgeInsetsGeometry? snackbarPadding,
    ShapeBorder? snackbarShape,
    double? snackbarWidth,
    DismissDirection snackbarDismissDirection = DismissDirection.down,
    Decoration? mainBodyDecoration,
    TextStyle? errorTextStyle,
    Color? mainBodyDecorationColor,
    String? labelChar,
    String? labelText,
    TextStyle? labelTextStyle,
    TextStyle? labelCharStyle,
  }) =>
      ScaffoldMessenger.of(this).showSnackBar(
        ErrorSnackbars(
          errorTextStyle: errorTextStyle,
          labelChar: labelChar,
          labelCharStyle: labelCharStyle,
          labelText: labelText,
          labelTextStyle: labelTextStyle,
          mainBodyDecoration: mainBodyDecoration,
          mainBodyDecorationColor: mainBodyDecorationColor,
          mainBodyKey: mainBodyKey,
          snackBarBehavior: snackBarBehavior,
          snackbarAction: snackbarAction,
          snackbarAnimation: snackbarAnimation,
          snackbarClipBehavior: snackbarClipBehavior,
          snackbarDismissDirection: snackbarDismissDirection,
          snackbarElevations: snackbarElevations,
          snackbarKey: snackbarKey,
          snackbarMargin: snackbarMargin,
          snackbarPadding: snackbarPadding,
          snackbarShape: snackbarShape,
          snackbarWidth: snackbarWidth,
          snackbaronVisible: snackbaronVisible,
          errorList: errorList,
        ),
      );
}
