import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool get isValidLowPassword => isNotNullAndNotEmpty
      ? RegExp(RegExpConstants.instance.passwordLowRegexp).hasMatch(this)
      : false;
  bool get isValidMediumPassword => isNotNullAndNotEmpty
      ? RegExp(RegExpConstants.instance.passwordMediumRegexp).hasMatch(this)
      : false;
  bool get isValidHardPassword => isNotNullAndNotEmpty
      ? RegExp(RegExpConstants.instance.passwordHardRegexp).hasMatch(this)
      : false;
}

extension AuthorizationExtension on String {
  Map<String, dynamic> get beraer => {'Authorization': 'Bearer ${this}'};
}

extension LaunchExtension on String {
  Future<bool> get launchEmail => launchUrl(Uri.parse('mailto:$this'));
  Future<bool> get launchPhone => launchUrl(Uri.parse('tel://$this'));
  Future<bool> get launchWebsite => launchUrl(Uri.parse(this));

  // Future<bool> launchWebsiteCuston({
  //   bool? forceSafariVC,
  //   bool forceWebView = false,
  //   bool enableJavaScript = false,
  //   bool enableDomStorage = false,
  //   bool universalLinksOnly = false,
  //   Map<String, String> headers = const <String, String>{},
  //   Brightness? statusBarBrightness,
  //   String? webOnlyWindowName,
  // }) =>

  // launchUrl(this,
  //     forceSafariVC: forceSafariVC,
  //     forceWebView: forceWebView,
  //     enableDomStorage: enableDomStorage,
  //     enableJavaScript: enableJavaScript,
  //     universalLinksOnly: universalLinksOnly,
  //     headers: headers,
  //     statusBarBrightness: statusBarBrightness,
  //     webOnlyWindowName: webOnlyWindowName);
}

extension ShareText on String {
  Future<void> shareWhatsApp() async {
    try {
      final isLaunch =
          await launchUrl(Uri.parse('${AppConstants.whatsAppPrefix}$this'));
      if (!isLaunch) await share();
    } catch (e) {
      await share();
    }
  }

  //
  Future<void> shareMail(String title) async {
    final value = DeviceUtility.instance.shareMailText(title, this);
    final encoded = Uri.encodeFull(this);
    final isLaunch = await launchUrl(Uri.parse(encoded));
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

extension LocaleFileData on String {
  Future<Uint8List> localeFileData() =>
      rootBundle.load(this).then((value) => value.buffer.asUint8List());
}

extension IfDebugging on String {
  String? get ifDebugging => kDebugMode ? this : null;
}

extension ToList on String {
  Uint8List toUint8List() => Uint8List.fromList(codeUnits);
}

extension SplitByLength on String {
  Iterable<String> splitByLength(int len, {String filler = '0'}) sync* {
    final missingFromLength =
        length % len == 0 ? 0 : len - (characters.length % len);
    final expectedLength = length + missingFromLength;
    final src = padLeft(expectedLength, filler);
    final chars = src.characters;
    for (var i = 0; i < chars.length; i += len) {
      yield chars.getRange(i, i + len).toString();
    }
  }
}

extension LocalFileData on String {
  Future<Uint8List> localFileData() => rootBundle.load(this).then(
        (value) => value.buffer.asUint8List(),
      );
}

extension ToListItemImage on String {
  Widget toListItemImage({double height = 150, double? width}) {
    return LimitedBox(
      maxHeight: height,
      maxWidth: width ?? double.infinity,
      child: Image.network(
        this,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

extension Minus on String {
  String operator -(String rhs) => replaceAll(rhs, '');
}

extension CanLauncher on String {
  void openLauncher(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}

extension ReplaceAll on String {
  String replaceMap(Map<String, String> fromList) {
    var result = this;
    fromList.forEach((key, value) {
      result = result.replaceAll(key, value);
    });
    return result;
  }
}

extension Toast on String {
  Future<void> showAsToast(BuildContext context,
      {required Duration duration}) async {
    final scaffold = ScaffoldMessenger.of(context);
    final controller = scaffold.showSnackBar(
      SnackBar(
        content: Text(this),
        backgroundColor: const Color(0xFF24283b),
        behavior: SnackBarBehavior.floating,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
    await Future.delayed(duration);
    controller.close();
  }
}
