// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/lazystream-in-flutter-and-dart/lazystream-in-flutter-and-dart.md

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:hucel_core/hucel_core.dart';

Stream<Uint8List> getImagesData(
  List<Future<Uint8List>> allData,
) async* {
  for (final data in allData) {
    yield await data;
  }
}

Future<List<Future<Uint8List>>> calculateAllData(
  List<String> path,
) async {
  final futures = Iterable.generate(
    path.length,
    (i) => '$i'.localFileData().then((value) => String.fromCharCodes(value)),
  );

  final result = Future.wait(futures);
  const lineSplitter = LineSplitter();
  List<Future<Uint8List>> allData = [];
  for (final string in await result) {
    final urls = lineSplitter.convert(string);
    for (final url in urls) {
      allData.add(
        NetworkAssetBundle(Uri.parse(url))
            .load(url)
            .then((value) => value.buffer.asUint8List()),
      );
    }
  }
  return allData;
}
