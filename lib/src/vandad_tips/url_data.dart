import 'dart:typed_data' show Uint8List;
import 'dart:io' show HttpClient;
import 'package:flutter/foundation.dart'
    show consolidateHttpClientResponseBytes;

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/url-data-in-dart/url-data-in-dart.dart
Future<Uint8List> getDataUrl(Uri url) async {
  final request = await HttpClient().getUrl(url);
  final response = await request.close();
  final bytes = await consolidateHttpClientResponseBytes(response);
  return bytes;
}
