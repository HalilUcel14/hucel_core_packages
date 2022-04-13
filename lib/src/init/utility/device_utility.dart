import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/src/constants/app_constants.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceUtility {
  static DeviceUtility? _instace;
  static DeviceUtility get instance {
    if (_instace != null) {
      return _instace!;
    }
    _instace = DeviceUtility._init();
    return _instace!;
  }

  //
  PackageInfo? packageInfo;
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  late IosDeviceInfo iosDeviceInfo;
  final Rect ipadPaddingBottum = const Rect.fromLTWH(30, 50, 30, 50);
  //
  DeviceUtility._init();
  //
  Future<bool> isIpad() async {
    iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    return iosDeviceInfo.name.toLowerCase().contains(AppConstants.ipadType);
  }

  String shareMailText(String title, String body) {
    return "mailto:?subject='$title'&body='$body'";
  }

  Future<void> initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}
