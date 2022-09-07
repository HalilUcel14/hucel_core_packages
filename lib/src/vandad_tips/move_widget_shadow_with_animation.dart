import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

// https://github.com/vandadnp/flutter-tips-and-tricks/tree/main/tipsandtricks/move-widget-shadows-with-animation

class ImageTransition extends AnimatedWidget {
  final String imageUrl;
  final double? radius;
  final Color? shadowColor;

  Animation<double> get shadowXOffSet => listenable as Animation<double>;

  const ImageTransition(
    this.imageUrl, {
    shadowXOffSet,
    Key? key,
    this.radius,
    this.shadowColor,
  }) : super(listenable: shadowXOffSet, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 20.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(shadowXOffSet.value, 20.0),
            color: shadowColor ?? Colors.black.withAlpha(100),
            spreadRadius: -10,
          ),
        ],
      ),
      child: HUNetworkImage(imageUrl: imageUrl),
    );
  }
}

class CustomCurve extends CurveTween {
  CustomCurve() : super(curve: Curves.easeInOutSine);
  @override
  double transform(double t) {
    return (super.transform(t) - 0.5) * 25.0;
  }
}

class UseImageTransitionWithShadow extends StatefulWidget {
  const UseImageTransitionWithShadow(
      {Key? key,
      this.duration,
      required this.imageUrl,
      this.radius,
      this.shadowColor})
      : super(key: key);

  final String imageUrl;
  final Duration? duration;
  final double? radius;
  final Color? shadowColor;

  @override
  State<UseImageTransitionWithShadow> createState() =>
      _UseImageTransitionWithShadowState();
}

class _UseImageTransitionWithShadowState
    extends State<UseImageTransitionWithShadow>
    with SingleTickerProviderStateMixin {
  //
  late final AnimationController _controller;
  late final Animation<double> _animation;
  //

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 1),
    );
    _animation = CustomCurve().animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat(reverse: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageTransition(
        widget.imageUrl,
        shadowXOffSet: _animation,
      ),
    );
  }
}
