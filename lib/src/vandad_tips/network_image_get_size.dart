import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/network-image-size-in-dart/network-image-size-in-dart.md
Future<Size> getImageSize(String uri) {
  final image = Image.network(uri);
  final comp = Completer<ui.Image>();
  image.image.resolve(ImageConfiguration.empty).addListener(ImageStreamListener(
        (ImageInfo info, _) => comp.complete(info.image),
      ));
  return comp.future.then((value) => Size(
        value.width.toDouble(),
        value.height.toDouble(),
      ));
}

// ignore: unused_element
void _testIt() async {
  final imageSize = await getImageSize('uri');
  assert(imageSize.width == 2048.0);
  assert(imageSize.height == 1365.0);
}
