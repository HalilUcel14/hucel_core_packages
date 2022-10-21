import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

extension ContextExtensionOther on BuildContext {
  bool get isScreenLow => width < mediumScreenSize;
  bool get widthExptreme => width >= 1500;
  bool get widthPrime => width >= hugeScreenSize && width < 1500;
  //
  bool isScreenWidthLow(double value) => width < value ? true : false;

  EdgeInsets padOnly(
          {double top = 0,
          double bottom = 0,
          double left = 0,
          double right = 0}) =>
      EdgeInsets.only(
        bottom: bottom,
        left: left,
        right: right,
        top: top,
      );
  EdgeInsets padSymetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  TextStyle? get responsiveHeadLine => widthExptreme
      ? headline1
      : widthPrime
          ? headline2
          : widthHuge
              ? headline3
              : widthLarge
                  ? headline4
                  : widthMedium
                      ? headline5
                      : headline6;
  //
  TextStyle? get responsiveTextHeadLine => width > 1500
      ? headline1
      : width > 1200
          ? headline2
          : width > 900
              ? headline3
              : headline4;

  //
  TextStyle? get appBarStyle => widthHuge
      ? primaryHeadline4
      : widthLarge
          ? primaryHeadline5
          : primaryHeadline6;
  // {
  //   return _constraints.maxWidth > _context.hugeScreenSize
  //       ? _context.primaryHeadline4
  //       : _constraints.maxWidth > _context.largeScreenSize
  //           ? _context.primaryHeadline5?.coBold
  //           : _context.primaryHeadline6?.coBold;
}
