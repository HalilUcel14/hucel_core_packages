import 'package:flutter/services.dart';

Future<void> setOnlyPortraitUp() {
  return SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
}

Future<void> setOnlyLandscape() {
  return SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ],
  );
}
