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

void _TestIt() async {
  final imagesize = await getImageSize('uri');
  print(imagesize);
  assert(imagesize.width == 2048.0);
  assert(imagesize.height == 1365.0);
  print(imagesize.aspectRatio);
}
