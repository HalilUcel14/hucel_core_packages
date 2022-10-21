import 'package:flutter/cupertino.dart';

class ExpandedAspectRatio extends Expanded {
  ExpandedAspectRatio({
    Key? expandedKey,
    Key? aspectKey,
    int flex = 1,
    Widget? child,
    required double aspectRatio,
  }) : super(
          key: expandedKey,
          flex: flex,
          child: AspectRatio(
            key: aspectKey,
            aspectRatio: aspectRatio,
            child: child,
          ),
        );
}
