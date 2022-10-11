import 'package:flutter/material.dart';

//
class ExpandedContainer extends Expanded {
  ExpandedContainer({
    Key? key,
    int flex = 1,
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
          flex: flex,
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

class CenterContainer extends Center {
  CenterContainer({
    Key? key,
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
