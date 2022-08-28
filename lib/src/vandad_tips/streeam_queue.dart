import 'dart:typed_data';

import 'package:flutter/services.dart';

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/streamqueue-in-flutter/streamqueue-in-flutter.dart
Stream<Uint8List> getImagesData(List<String> images) async* {
  for (final url in images) {
    final bundle = NetworkAssetBundle(Uri.parse(url));
    final loaded = await bundle.load(url);
    final bytes = loaded.buffer.asUint8List();
    yield bytes;
  }
}
