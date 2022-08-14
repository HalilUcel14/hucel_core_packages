import 'package:flutter/material.dart';

class HUAnimatedIcon extends StatefulWidget {
  const HUAnimatedIcon({
    Key? key,
    required this.icon,
    this.duration,
    this.color,
    this.size,
    this.semanticLabel,
    this.textDirection,
  }) : super(key: key);

  final Duration? duration;
  final AnimatedIconData icon;
  final Color? color;
  final double? size;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  State<HUAnimatedIcon> createState() => _HUAnimatedIconState();
}

class _HUAnimatedIconState extends State<HUAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _animation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat(reverse: true);
    return AnimatedIcon(
      progress: _animation,
      icon: widget.icon,
      color: widget.color ?? Colors.black,
      semanticLabel: widget.semanticLabel,
      size: widget.size,
      textDirection: widget.textDirection,
    );
  }
}
