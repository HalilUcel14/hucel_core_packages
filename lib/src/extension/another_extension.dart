// ---------- Cancelable Api ---------------------
import 'dart:typed_data';

import 'package:async/async.dart' show CancelableOperation;

import 'package:flutter/services.dart';
import 'package:hucel_core/hucel_core.dart';

CancelableOperation<Uint8List> getImageOperation(String url) =>
    CancelableOperation.fromFuture(
      NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then((value) => value.buffer.asUint8List()),
      onCancel: () => 'images/template.png'.localeFileData(),
    );
