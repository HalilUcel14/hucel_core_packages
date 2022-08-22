// ---------- Cancelable Api ---------------------
import 'package:async/async.dart' show CancelableOperation;
import 'dart:typed_data' show Uint8List;

import 'package:flutter/services.dart';
import 'package:hucel_core/hucel_core.dart';

CancelableOperation<Uint8List> getImageOperation(String url) =>
    CancelableOperation.fromFuture(
      NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then((value) => value.buffer.asUint8List()),
      onCancel: () => 'images/template.png'.localeFileData(),
    );
