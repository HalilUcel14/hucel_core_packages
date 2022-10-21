import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:lottie/lottie.dart';

class AnimatedLottieNetwork extends StatefulWidget {
  final String path;
  final String? pushNamed;
  final Animation<double>? controller;
  final bool? animate;
  final FrameRate? frameRate;
  final bool? repeat;
  final bool? reverse;
  final LottieDelegates? delegates;
  final LottieOptions? options;
  final void Function(LottieComposition)? onLoaded;
  final ImageProvider<Object>? Function(LottieImageAsset)? imageProviderFactory;
  final AssetBundle? bundle;
  final Future<void>? future;
  final Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final String? package;
  final bool? addRepaintBoundary;
  final FilterQuality? filterQuality;
  final void Function(String)? onWarning;

  ///
  ///
  const AnimatedLottieNetwork({
    Key? assetKey,
    required this.path,
    this.controller,
    this.animate = true,
    this.frameRate,
    this.repeat,
    this.reverse,
    this.delegates,
    this.options,
    this.onLoaded,
    this.imageProviderFactory,
    this.bundle,
    this.frameBuilder,
    this.errorBuilder,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment,
    this.package,
    this.addRepaintBoundary,
    this.filterQuality,
    this.onWarning,
    this.pushNamed,
    this.future,
  }) : super(key: assetKey);

  @override
  State<AnimatedLottieNetwork> createState() => _AnimatedLottieNetworkState();
}

class _AnimatedLottieNetworkState extends State<AnimatedLottieNetwork>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;
  late final BuildContext _context;

  @override
  void initState() {
    lottieController = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  void get push {
    if (widget.pushNamed != null) {
      _context.pushNameAndRemoveUntil(widget.pushNamed!);
    }
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    //
    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        if (widget.future != null) {
          await widget.future;
        }
        push;
        lottieController.reset();
      }
    });
    //
    return Lottie.network(
      widget.path,
      fit: widget.fit,
      // default olarak true gelir animasyon durdurma oynatma,
      height: widget.height,
      width: widget.width,
      animate: widget.animate,
      onLoaded: widget.onLoaded ??
          (composition) {
            lottieController.duration = composition.duration;
            lottieController.forward();
          },
      addRepaintBoundary: widget.addRepaintBoundary,
      alignment: widget.alignment,
      controller: widget.controller,
      delegates: widget.delegates,
      errorBuilder: widget.errorBuilder,
      filterQuality: widget.filterQuality,
      frameBuilder: widget.frameBuilder,
      frameRate: widget.frameRate,
      imageProviderFactory: widget.imageProviderFactory,
      onWarning: widget.onWarning,
      options: widget.options,
      repeat: widget.repeat,
      reverse: widget.reverse,
    );
  }
}
