import 'dart:typed_data';

import 'package:flutter/services.dart' show NetworkAssetBundle;

import 'package:async/async.dart' show AsyncMemoizer;

class GetImageApi {
  final String url;
  final _fetch = AsyncMemoizer<Uint8List>();

  GetImageApi(this.url);

  Future<Uint8List> fetch() => _fetch.runOnce(
        () => NetworkAssetBundle(Uri.parse(url)).load(url).then(
              (value) => value.buffer.asUint8List(),
            ),
      );
}
