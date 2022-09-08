import 'dart:typed_data';
import 'dart:io' show File;
import 'package:flutter/widgets.dart';
import 'dart:async' show Completer;
import 'package:flutter/material.dart' as material
    show Image, ImageConfiguration, ImageStreamListener;

extension ImageRotateExtension on Image {
  Widget get rightRotation =>
      RotationTransition(turns: const AlwaysStoppedAnimation(0.5), child: this);
  Widget get upRotation => RotationTransition(
      turns: const AlwaysStoppedAnimation(0.25), child: this);
  Widget get downRotation => RotationTransition(
      turns: const AlwaysStoppedAnimation(0.75), child: this);
  Widget get leftRotation =>
      RotationTransition(turns: const AlwaysStoppedAnimation(1), child: this);
}

extension GetImageAspectRatio on material.Image {
  Future<double> getAspectRatio() {
    final completer = Completer<double>();
    image.resolve(const material.ImageConfiguration()).addListener(
      material.ImageStreamListener(
        (image, synchronousCall) {
          final aspectRatio = image.image.width / image.image.height;
          image.image.dispose();
          completer.complete(aspectRatio);
        },
      ),
    );
    return completer.future;
  }
}

extension GetImageDataAspectRatio on Uint8List {
  Future<double> getAspectRatio() async {
    final image = material.Image.memory(this);
    return image.getAspectRatio();
  }
}

typedef FilePath = String;

extension GetImageFileAspectRatio on FilePath {
  Future<double> getAspectRatio() {
    final file = File(this);
    final image = material.Image.file(file);
    return image.getAspectRatio();
  }
}
