import 'package:flutter/material.dart';

import '../../enum/aspect_ratio_enum.dart';

class AspectRatioContainer extends AspectRatio {
  AspectRatioContainer({
    Key? key,
    required AspectRatioType type,
    //
    Key? containerKey,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Widget? child,
    Clip clipBehavior = Clip.none,
  }) : super(
          key: key,
          aspectRatio: type.size,
          child: Container(
            key: containerKey,
            alignment: alignment,
            child: child,
            clipBehavior: clipBehavior,
            color: color,
            constraints: constraints,
            decoration: decoration,
            foregroundDecoration: foregroundDecoration,
            height: height,
            margin: margin,
            padding: padding,
            transform: transform,
            transformAlignment: transformAlignment,
            width: width,
          ),
        );
}
