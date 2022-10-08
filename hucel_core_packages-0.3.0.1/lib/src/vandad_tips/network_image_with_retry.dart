//@immutable
import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RetryStrategy {
  final bool shouldRetry;
  final Duration waitBeforeRetry;
  const RetryStrategy({
    required this.shouldRetry,
    required this.waitBeforeRetry,
  });
}

typedef Retrier = RetryStrategy Function(
  String url,
  Object error,
);

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/network-image-retry-in-flutter/network-image-retry-in-flutter.dart
class NetworkImageWithRetry extends StatelessWidget {
  NetworkImageWithRetry({
    Key? key,
    required this.loadingWidget,
    required this.errorWidget,
    required this.url,
    required this.retrier,
  }) : super(key: key);
  //
  final Widget loadingWidget;
  final Widget errorWidget;
  final String url;
  final Retrier retrier;

  final _controller = StreamController<Uint8List>.broadcast();

  //

  void getData() async {
    while (true == true) {
      try {
        final networkAsset = NetworkAssetBundle(Uri.parse(url));
        final loaded = await networkAsset.load(url);
        final bytes = loaded.buffer.asUint8List();
        _controller.sink.add(bytes);
      } catch (e) {
        final strategy = retrier(url, e);
        if (strategy.shouldRetry) {
          await Future.delayed(strategy.waitBeforeRetry);
        } else {
          _controller.sink.addError(e);
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return StreamBuilder(
      stream: _controller.stream,
      builder: (context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.hasError) {
          return errorWidget;
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            return Image.memory(snapshot.data!);
          } else {
            return loadingWidget;
          }
        }
      },
    );
  }
}

///
// Widget useNetworkImageWithRetry() {
//   return NetworkImageWithRetry(
//       loadingWidget: const CircularProgressIndicator(),
//       errorWidget: const Text('Got an Error!'),
//       url: 'url',
//       retrier: (url, error) {
//         return RetryStrategy(
//           shouldRetry: error is! FlutterError,
//           waitBeforeRetry: const Duration(seconds: 1),
//         );
//       });
// }
