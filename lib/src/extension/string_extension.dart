import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hucel_core/src/constants/app_constants.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/input_constants.dart';
import '../constants/regexp_constants.dart';
import '../exception/page_info_exceptions.dart';
import '../init/utility/device_utility.dart';

extension StringExtension on String {
  String get tlMoney => "$this TL";
  String get usdMoney => "$this USD";
  String get euroMoney => "$this EUR";
  String get chfMoney => "$this CHF";
  String get poundMoney => "$this £";

  ///
  String get rightSpace => "$this ";
  String get rightTabSpace => "$this   ";
  String get leftSpace => " $this";
  String get leftTabSpace => "   $this";
  String get space => " $this ";
  String get tabSpace => "   $this   ";
}

extension DefaultAssets on String {
  String get getSvgIcon => "assets/icons/$this.svg";
  String get getPngIcon => "assets/icons/$this.png";
  String get getJpgIcon => "assets/icons/$this.jpg";

  ///
  String get getSvgImage => "assets/images/$this.svg";
  String get getPngImage => "assets/images/$this.png";
  String get getJpgImage => "assets/images/$this.jpg";
}

extension StringColorExtension on String {
  Color get color => Color(int.parse("0xff$this"));
}

extension StringValidator on String {
  bool get isNullOrEmpty => isEmpty;
  bool get isNotNullAndNotEmpty => !isNullOrEmpty;

  bool get isValidEmail => isNotNullAndNotEmpty
      ? RegExp(RegExpConstants.instance.emailRegexp).hasMatch(this)
      : false;
  bool get isValidPassword => isNotNullAndNotEmpty
      ? RegExp(RegExpConstants.instance.passwordRegexp).hasMatch(this)
      : false;
}

extension AuthorizationExtension on String {
  Map<String, dynamic> get beraer => {'Authırization': 'Bearer ${this}'};
}

extension LaunchExtension on String {
  Future<bool> get launchEmail => launch('mailto:$this');
  Future<bool> get launchPhone => launch('tel:$this');
  Future<bool> get launchWebsite => launch(this);

  Future<bool> launchWebsiteCuston({
    bool? forceSafariVC,
    bool forceWebView = false,
    bool enableJavaScript = false,
    bool enableDomStorage = false,
    bool universalLinksOnly = false,
    Map<String, String> headers = const <String, String>{},
    Brightness? statusBarBrightness,
    String? webOnlyWindowName,
  }) =>
      launch(this,
          forceSafariVC: forceSafariVC,
          forceWebView: forceWebView,
          enableDomStorage: enableDomStorage,
          enableJavaScript: enableJavaScript,
          universalLinksOnly: universalLinksOnly,
          headers: headers,
          statusBarBrightness: statusBarBrightness,
          webOnlyWindowName: webOnlyWindowName);
}

extension ShareText on String {
  Future<void> shareWhatsApp() async {
    try {
      final isLaunch = await launch('${AppConstants.whatsAppPrefix}$this');
      if (!isLaunch) await share();
    } catch (e) {
      await share();
    }
  }

  //
  Future<void> shareMail(String title) async {
    final value = DeviceUtility.instance.shareMailText(title, this);
    final isLaunch = await launch(Uri.encodeFull(value));
    if (!isLaunch) await value.share();
  }

  //
  Future<void> share() async {
    if (Platform.isIOS) {
      final isAppIpad = await DeviceUtility.instance.isIpad();
      if (isAppIpad) {
        await Share.share(this,
            sharePositionOrigin: DeviceUtility.instance.ipadPaddingBottum);
      }
    }
    await Share.share(this);
  }
}

extension FormatterExtension on String {
  String get phoneFormatValue =>
      InputFormatter.instance.phoneFormatter.unmaskText(this);
  String get timeFormatValue =>
      InputFormatter.instance.timeFormatter.unmaskText(this);
  String get timeUnderLineFormatValue =>
      InputFormatter.instance.timeFormatterUnderLine.unmaskText(this);
}

extension PackageInfoExtension on String {
  String get appName {
    if (DeviceUtility.instance.packageInfo == null) {
      throw PackageInfoNotFound();
    } else {
      return DeviceUtility.instance.packageInfo!.appName;
    }
  }
}

String get packageName {
  if (DeviceUtility.instance.packageInfo == null) {
    throw PackageInfoNotFound();
  } else {
    return DeviceUtility.instance.packageInfo!.packageName;
  }
}

String get version {
  if (DeviceUtility.instance.packageInfo == null) {
    throw PackageInfoNotFound();
  } else {
    return DeviceUtility.instance.packageInfo!.version;
  }
}

String get buildNumber {
  if (DeviceUtility.instance.packageInfo == null) {
    throw PackageInfoNotFound();
  } else {
    return DeviceUtility.instance.packageInfo!.buildNumber;
  }
}

extension StringPathValidator on String {
  String pngPath(String path) => "$path/$this.png";
  String svgPath(String path) => "$path/$this.svg";
  String jpgPath(String path) => "$path/$this.jpg";
}

extension NetworkImageExtension on String {
  String get randomImage => 'https://picsum.photos/200/300';
  String get randomSquareImage => 'https://picsum.photos/200';
  String randomBigSquareImage(int value) => 'https://picsum.photos/$value';

  String get customProfileImage => 'https://www.gravatar.com/avatar/?d=mp';
  String get customHighProfileImage =>
      'https://www.gravatar.com/avatar/?d=mp&s=200';
}
