import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hucel_core/src/init/utility/platform_detail.dart';

import '../../hucel_core.dart';

extension ContextThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Color get backgroundColor => theme.backgroundColor;
  TextTheme get primaryTextTheme => theme.primaryTextTheme;
  ColorScheme get colorSheme => theme.colorScheme;

  Brightness get appBrightness => mediaQuery.platformBrightness;
}

extension TextStyleExtension on BuildContext {
  //
  TextStyle? get headline1 => textTheme.headline1;
  TextStyle? get headline2 => textTheme.headline2;
  TextStyle? get headline3 => textTheme.headline3;
  TextStyle? get headline4 => textTheme.headline4;
  TextStyle? get headline5 => textTheme.headline5;
  TextStyle? get headline6 => textTheme.headline6;
  //
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get bodyText1 => textTheme.bodyText1;
  TextStyle? get bodyText2 => textTheme.bodyText2;
  //
  TextStyle? get buttonTextStyle => textTheme.button;
  TextStyle? get captionTextStyle => textTheme.caption;
  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  //
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;
  TextStyle? get subTitle => textTheme.subtitle1;
  TextStyle? get subTitle2 => textTheme.subtitle2;

  ///
  ///

  TextTheme get primaryText => theme.primaryTextTheme;
  //
  TextStyle? get primaryHeadline1 => primaryText.headline1;
  TextStyle? get primaryHeadline2 => primaryText.headline2;
  TextStyle? get primaryHeadline3 => primaryText.headline3;
  TextStyle? get primaryHeadline4 => primaryText.headline4;
  TextStyle? get primaryHeadline5 => primaryText.headline5;
  TextStyle? get primaryHeadline6 => primaryText.headline6;
//
  TextStyle? get primarybodyLarge => primaryText.bodyLarge;
  TextStyle? get primarybodyMedium => primaryText.bodyMedium;
  TextStyle? get primarybodySmall => primaryText.bodySmall;
  TextStyle? get primarybodyText1 => primaryText.bodyText1;
  TextStyle? get primarybodyText2 => primaryText.bodyText2;
  //
  TextStyle? get primarybuttonTextStyle => primaryText.button;
  TextStyle? get primarycaptionTextStyle => primaryText.caption;
  TextStyle? get primarydisplayLarge => primaryText.displayLarge;
  TextStyle? get primarydisplayMedium => primaryText.displayMedium;
  TextStyle? get primarydisplaySmall => primaryText.displaySmall;
  //
  TextStyle? get primarylabelLarge => primaryText.labelLarge;
  TextStyle? get primarylabelMedium => primaryText.labelMedium;
  TextStyle? get primarylabelSmall => primaryText.labelSmall;
  TextStyle? get primarysubTitle => primaryText.subtitle1;
  TextStyle? get primarysubTitle2 => primaryText.subtitle2;
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  //
  Size get size => mediaQuery.size;
  //
  double get width => size.width;
  double get height => size.height;
  double get longestSide => size.longestSide;
  double get shortestSide => size.shortestSide;

  ///
  ///
  double dynamicShortSize(double value) => shortestSide * value;
  double dynamicLongSize(double value) => longestSide * value;
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

}

// Device Screen Type By Width(300-600-900)
// Values from https://flutter.dev/docs/development/ui/layout/building-adaptive-apps
extension ResponsiveScreenExtension on BuildContext {
  ResponsivityConstants get _const => ResponsivityConstants.instance;
  //
  double get smallScreenSize => _const.smallScreenSize.toDouble();
  double get mediumScreenSize => _const.mediumScreenSize.toDouble();
  double get largeScreenSize => _const.largeScreenSize.toDouble();
  double get hugeScreenSize => _const.hugeScreenSize.toDouble();
  double get widthSize1500 => _const.sizeWidth1500.toDouble();
  double get widthSize1800 => _const.sizeWidth1800.toDouble();

  bool get widthSmall => width >= smallScreenSize && width < mediumScreenSize;
  bool get widthMedium => width >= mediumScreenSize && width < largeScreenSize;
  bool get widthLarge => width >= largeScreenSize && width < hugeScreenSize;
  bool get widthHuge => width >= hugeScreenSize;
}

extension DeviceOSExtension on BuildContext {
  PlatformDetails get currentPlatform => PlatformDetails.internal();
  // bool get isAndroid => Platform.isAndroid;
  // bool get isIOS => Platform.isIOS;
  // bool get isWindows => Platform.isWindows;
  // bool get isLinux => Platform.isLinux;
  // bool get isMacOS => Platform.isMacOS;
  // bool get isMobile => isAndroid || isIOS;
  // bool get isDesktopWeb => isWindows || isLinux || isMacOS;
}

extension OrientationExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
  Orientation get portrait => Orientation.portrait;
  Orientation get landscape => Orientation.landscape;
}

extension ColorExtension on BuildContext {
  MaterialColor get randomColor => Colors.primaries[17.randomValue];
  LinearGradient get randomGradientColor =>
      LinearGradient(colors: [randomColor, randomColor]);
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
  EdgeInsetsGeometry get responsiveAllPad => widthHuge
      ? padAllM
      : widthLarge
          ? padAllN
          : widthMedium
              ? padAllS
              : padAllXS;
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
  EdgeInsetsGeometry get responsiveHorizontalPad => widthHuge
      ? padHorizontalM
      : widthLarge
          ? padHorizontalN
          : widthMedium
              ? padHorizontalS
              : padHorizontalXS;
  //
  EdgeInsets get padVerticalXS => EdgeInsets.symmetric(vertical: heightXS);
  EdgeInsets get padVerticalS => EdgeInsets.symmetric(vertical: heightS);
  EdgeInsets get padVerticalN => EdgeInsets.symmetric(vertical: heightN);
  EdgeInsets get padVerticalM => EdgeInsets.symmetric(vertical: heightM);
  EdgeInsets get padVerticalL => EdgeInsets.symmetric(vertical: heightL);
  EdgeInsets get padVerticalXL => EdgeInsets.symmetric(vertical: heightXL);
  EdgeInsets get padVerticalXXL => EdgeInsets.symmetric(vertical: heightXXL);
  //
  EdgeInsetsGeometry get responsiveVerticalPad => widthHuge
      ? padVerticalM
      : widthLarge
          ? padVerticalN
          : widthMedium
              ? padVerticalS
              : padVerticalXS;
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

extension BorderRadiusExtension on BuildContext {
  Radius get radiusXS => Radius.circular(heightXS);
  Radius get radiusS => Radius.circular(heightS);
  Radius get radiusN => Radius.circular(heightN);
  Radius get radiusM => Radius.circular(heightM);
  Radius get radiusL => Radius.circular(heightL);
  Radius get radiusXL => Radius.circular(heightXL);
  Radius get radiusXXL => Radius.circular(heightXXL);
  //
  BorderRadius borderRadiusAllDynamic(Radius value) => BorderRadius.all(value);
  //
  BorderRadius get borderRadiusAllXS => borderRadiusAllDynamic(radiusXS);
  BorderRadius get borderRadiusAllS => borderRadiusAllDynamic(radiusS);
  BorderRadius get borderRadiusAllN => borderRadiusAllDynamic(radiusN);
  BorderRadius get borderRadiusAllM => borderRadiusAllDynamic(radiusM);
  BorderRadius get borderRadiusAllL => borderRadiusAllDynamic(radiusL);
  BorderRadius get borderRadiusAllXL => borderRadiusAllDynamic(radiusXL);
  BorderRadius get borderRadiusAllXXL => borderRadiusAllDynamic(radiusXXL);
  //
  //
  BorderRadius borderRadiusTopDynamic(Radius value) =>
      BorderRadius.only(topLeft: value, topRight: value);
  //
  BorderRadius get borderRadiusTopXS => borderRadiusTopDynamic(radiusXS);
  BorderRadius get borderRadiusTopS => borderRadiusTopDynamic(radiusS);
  BorderRadius get borderRadiusTopN => borderRadiusTopDynamic(radiusN);
  BorderRadius get borderRadiusTopM => borderRadiusTopDynamic(radiusM);
  BorderRadius get borderRadiusTopL => borderRadiusTopDynamic(radiusL);
  BorderRadius get borderRadiusTopXL => borderRadiusTopDynamic(radiusXL);
  BorderRadius get borderRadiusTopXXL => borderRadiusTopDynamic(radiusXXL);
  //
  BorderRadius borderRadiusBottomDynamic(Radius value) =>
      BorderRadius.only(bottomLeft: value, bottomRight: value);
  //
  BorderRadius get borderRadiusBottomXS => borderRadiusBottomDynamic(radiusXS);
  BorderRadius get borderRadiusBottomS => borderRadiusBottomDynamic(radiusS);
  BorderRadius get borderRadiusBottomN => borderRadiusBottomDynamic(radiusN);
  BorderRadius get borderRadiusBottomM => borderRadiusBottomDynamic(radiusM);
  BorderRadius get borderRadiusBottomL => borderRadiusBottomDynamic(radiusL);
  BorderRadius get borderRadiusBottomXL => borderRadiusBottomDynamic(radiusXL);
  BorderRadius get borderRadiusBottomXXL =>
      borderRadiusBottomDynamic(radiusXXL);

  //
  BorderRadius get responsiveBorderRadiusAll => widthHuge
      ? borderRadiusAllM
      : widthLarge
          ? borderRadiusAllN
          : widthMedium
              ? borderRadiusAllS
              : borderRadiusAllXS;
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

extension ScaffoldMessengerOfContextExtension on BuildContext {
  ScaffoldMessengerState get _messenger => ScaffoldMessenger.of(this);

  showSnackbar(SnackBar snack) => _messenger.showSnackBar(snack);
  showBanner(MaterialBanner banner) => _messenger.showMaterialBanner(banner);
  get removeCurrentSnackbar => _messenger.removeCurrentSnackBar();
  get hideCurrentSnackbar => _messenger.hideCurrentSnackBar();
  get clearCurrentSnackbar => _messenger.clearSnackBars();
  get removeCurrentBanner => _messenger.removeCurrentMaterialBanner();
  get clearCurrentBaner => _messenger.clearMaterialBanners();
}

extension FunctionOnContext on BuildContext {
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;
}

extension GetArgument on BuildContext {
  T? getArgument<T>() {
    final modalRoute = ModalRoute.of(this);
    if (modalRoute != null) {
      final args = modalRoute.settings.arguments;
      if (args != null && args is T) {
        return args as T;
      }
    }
    return null;
  }
}
