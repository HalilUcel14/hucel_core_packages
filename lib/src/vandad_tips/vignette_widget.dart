import 'package:flutter/material.dart';

class Vignette extends StatelessWidget {
  const Vignette({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: RadialGradient(
              colors: [
                Colors.transparent,
                Colors.black.withAlpha(200),
              ],
              radius: 0.6,
              stops: const [0.7, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}
