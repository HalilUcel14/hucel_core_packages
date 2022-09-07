import 'package:flutter/material.dart';
import 'dart:math' as math show pi;

extension AsDegreesToRadians<T extends num> on T {
  double asDegreesToRadians() => toDouble() * (math.pi / 180.0);
}

class NetworkImageWithTransform extends StatelessWidget {
  const NetworkImageWithTransform({
    Key? key,
    required this.index,
    required this.url,
  }) : super(key: key);
  //
  final int index;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -((index * 10.0).asDegreesToRadians()),
      child: Transform.translate(
        offset: Offset(-20.0 * index.toDouble(), 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            url,
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

extension IterationWithIndex<T> on Iterable<T> {
  Iterable<E> mapWithIndexAndCount<E>(
    E Function(int index, int count, T value) f,
  ) =>
      Iterable.generate(length, (i) => f(i, length, elementAt(i)));
}

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/image-gallery-in-flutter/image-gallery-in-flutter.dart
class CenterTransformImageNetwork extends StatelessWidget {
  const CenterTransformImageNetwork({Key? key, required this.imageUrls})
      : super(key: key);

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.5,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        heightFactor: 0.4,
        child: Transform.translate(
          offset: const Offset(20.0, 0.0),
          child: Transform.rotate(
            angle: 10.asDegreesToRadians(),
            child: Stack(
              children: imageUrls
                  .mapWithIndexAndCount((index, count, value) =>
                      NetworkImageWithTransform(
                          index: count - index - 1, url: value))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
