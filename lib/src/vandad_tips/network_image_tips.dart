import 'package:flutter/material.dart';

class HUNetworkImage extends StatelessWidget {
  const HUNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.frameBuilder,
      this.semanticLabel,
      this.width,
      this.height,
      this.color,
      this.opacity,
      this.colorBlendMode,
      this.fit,
      this.centerSlice,
      this.headers,
      this.cacheWidth,
      this.cacheHeight})
      : super(key: key);

  final String imageUrl;
  final double scale = 1.0;
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  final String? semanticLabel;
  final bool excludeFromSemantics = false;
  final double? width;
  final double? height;
  final Color? color;
  final Animation<double>? opacity;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final AlignmentGeometry alignment = Alignment.center;
  final ImageRepeat repeat = ImageRepeat.noRepeat;
  final Rect? centerSlice;
  final bool matchTextDirection = false;
  final bool gaplessPlayback = false;
  final FilterQuality filterQuality = FilterQuality.low;
  final bool isAntiAlias = false;
  final Map<String, String>? headers;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, loadingProgress) {
        final totalBytes = loadingProgress?.expectedTotalBytes;
        final bytesLoaded = loadingProgress?.cumulativeBytesLoaded;
        if (totalBytes != null && bytesLoaded != null) {
          return LinearProgressIndicator(
            value: bytesLoaded / totalBytes,
          );
        } else {
          return child;
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Text('$error');
      },
      alignment: alignment,
      cacheHeight: cacheHeight,
      cacheWidth: cacheWidth,
      centerSlice: centerSlice,
      color: color,
      colorBlendMode: colorBlendMode,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      fit: fit ?? BoxFit.cover,
      frameBuilder: frameBuilder,
      gaplessPlayback: gaplessPlayback,
      headers: headers,
      height: height,
      isAntiAlias: isAntiAlias,
      matchTextDirection: matchTextDirection,
      opacity: opacity,
      repeat: repeat,
      scale: scale,
      semanticLabel: semanticLabel,
      width: width,
    );
  }
}

class HUNetworkImageCard extends StatelessWidget {
  const HUNetworkImageCard({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: HUNetworkImage(imageUrl: url),
      ),
    );
  }
}
