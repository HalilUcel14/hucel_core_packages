import 'dart:io';

import 'package:flutter/services.dart';

class NetworkImageAsset {
  final String localPath;
  final String url;
  NetworkImageAsset({required int index})
      : localPath = Directory.systemTemp.path + '/$index.png',
        url = 'https://127.0.0.1:5500/images/$index.png';

  Future<bool> downloadAndSave() => NetworkAssetBundle(Uri.parse(url))
      .load(url)
      .then((byteData) => byteData.buffer.asUint8List())
      .then((data) => File(localPath).writeAsBytes(data).then((value) => true))
      .catchError((_) => false);
}
