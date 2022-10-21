import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({
    Key? key,
    required this.url,
    this.size,
    this.animate = false,
    this.duration,
    this.isCompletedFunction,
    this.addRepaintBoundary,
    this.alignment,
    this.delegates,
    this.filterQuality,
    this.fit,
    this.frameRate,
    this.imageProviderFactory,
    this.lottieKey,
    this.onWarning,
    this.options,
    this.repeat,
    this.reverse,
    this.controller,
    this.padding,
  }) : super(key: key);

  final String url;
  final double? size;
  final bool animate;
  final Duration? duration;
  final void Function()? isCompletedFunction;
  final bool? addRepaintBoundary;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final LottieDelegates? delegates;
  final FilterQuality? filterQuality;
  final BoxFit? fit;
  final FrameRate? frameRate;
  final ImageProvider<Object>? Function(LottieImageAsset)? imageProviderFactory;
  final Key? lottieKey;
  final void Function(String)? onWarning;
  final LottieOptions? options;
  final bool? repeat;
  final bool? reverse;
  final AnimationController? controller;

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with TickerProviderStateMixin {
  @override
  late AnimationController controller;
  bool isLoaded = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 1),
    );

    //
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isLoaded = !isLoaded;
        setState(() {});
      }
    });

    //
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      widget.url,
      width: widget.size,
      height: widget.size,
      animate: widget.animate,
      controller: widget.controller ?? controller,
      addRepaintBoundary: widget.addRepaintBoundary,
      alignment: widget.alignment,
      delegates: widget.delegates,
      filterQuality: widget.filterQuality,
      fit: widget.fit,
      frameRate: widget.frameRate,
      imageProviderFactory: widget.imageProviderFactory,
      key: widget.key,

      onWarning: widget.onWarning,
      options: widget.options,
      repeat: widget.repeat,
      reverse: widget.reverse,
      //
      onLoaded: (comp) {
        controller.duration == comp.duration;
        if (widget.isCompletedFunction != null) {
          widget.isCompletedFunction!.call();
        }
        controller.forward();
      },
      //
      frameBuilder: (context, child, comp) {
        return Padding(
          padding: widget.padding ?? const EdgeInsets.all(8.0),
          child: child,
        );
      },
      //
      errorBuilder: (context, object, stactTrace) {
        if (kDebugMode) {
          return throw Exception('$this Lottie Network İs Error : $stactTrace');
        }
        return const Icon(Icons.error);
      },
    );
  }
}
