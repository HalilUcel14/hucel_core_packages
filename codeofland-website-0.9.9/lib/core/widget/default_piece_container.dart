import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class DefaultPieceContainer extends Container {
  DefaultPieceContainer({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    ResponsiveChild? child,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width = double.infinity,
    double? height = 1080,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) : super(
          key: key,
          height: height,
          width: width,
          decoration: decoration,
          alignment: alignment,
          child: child,
          clipBehavior: clipBehavior,
          color: color,
          constraints: constraints,
          foregroundDecoration: foregroundDecoration,
          margin: margin,
          padding: padding,
          transform: transform,
          transformAlignment: transformAlignment,
        );
}
