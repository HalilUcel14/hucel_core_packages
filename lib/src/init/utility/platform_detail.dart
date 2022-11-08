import 'package:flutter/foundation.dart';

class PlatformDetails {
  static final PlatformDetails _singleton = PlatformDetails.internal();
  factory PlatformDetails() {
    return _singleton;
  }
  PlatformDetails.internal();
  //
  TargetPlatform get platform => defaultTargetPlatform;
  TargetPlatform get macOs => TargetPlatform.macOS;
  TargetPlatform get linux => TargetPlatform.linux;
  TargetPlatform get windows => TargetPlatform.windows;
  TargetPlatform get ios => TargetPlatform.iOS;
  TargetPlatform get android => TargetPlatform.android;

  //
  static bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.windows;
  static bool get isMobile =>
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIos => defaultTargetPlatform == TargetPlatform.iOS;
}
