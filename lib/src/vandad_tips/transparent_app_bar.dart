// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentAppBar extends AppBar {
  //
  @override
  final Widget? leading;
  @override
  final bool automaticallyImplyLeading = true;
  @override
  final Widget? title;
  @override
  final List<Widget>? actions;
  @override
  final Widget? flexibleSpace;
  @override
  final PreferredSizeWidget? bottom;
  @override
  final double? elevation;
  @override
  final double? scrolledUnderElevation;
  @override
  final Color? shadowColor;
  @override
  final Color? surfaceTintColor;
  @override
  final ShapeBorder? shape;
  @override
  final Color? backgroundColor;
  @override
  final Color? foregroundColor;
  @override
  final Brightness? brightness;
  @override
  final IconThemeData? iconTheme;
  @override
  final IconThemeData? actionsIconTheme;
  @override
  final TextTheme? textTheme;
  @override
  final bool primary = true;
  @override
  final bool? centerTitle;
  @override
  final bool excludeHeaderSemantics = false;
  @override
  final double? titleSpacing;
  @override
  final double toolbarOpacity = 1.0;
  @override
  final double bottomOpacity = 1.0;
  @override
  final double? toolbarHeight;
  @override
  final double? leadingWidth;
  @override
  final bool? backwardsCompatibility;
  @override
  final TextStyle? toolbarTextStyle;
  @override
  final TextStyle? titleTextStyle;
  @override
  final SystemUiOverlayStyle? systemOverlayStyle;
  //

  TransparentAppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.scrolledUnderElevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarHeight,
    this.leadingWidth,
    this.backwardsCompatibility,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  }) : super(
          key: key,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: backgroundColor ?? Colors.blueAccent.withAlpha(150),
        );
}
