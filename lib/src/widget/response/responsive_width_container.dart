import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

class ResponsiveChild extends StatelessWidget {
  ResponsiveChild({
    super.key,
    this.size = const [300, 600, 900, 1200],
    this.small,
    this.medium,
    this.large,
    this.huge,
    this.isScrolled = true,
  }) : assert(small != null || medium != null || large != null);
  //
  /// Screen size[0] < Width < size[1]
  final Widget? small;

  final List<double> size;

  /// Screen size[1] < Width < size[2]
  final Widget? medium;

  /// Screen  Width size [2] < width > size[3]
  final Widget? large;

  /// Screen Width  width < size[3]
  final Widget? huge;

  final bool isScrolled;

  //
  @override
  Widget build(BuildContext context) {
    bool smallSize = context.width >= size[0] && context.width < size[1];
    bool mediumSize = context.width >= size[1] && context.width < size[2];
    bool largeSize = context.width >= size[2] && context.width < size[3];
    bool hugeSize = context.width >= size[3];
    //
    Widget? scroll = isScrolled ? isSmall(context) : small;
    return smallSize
        ? scroll ?? medium ?? large ?? huge!
        : mediumSize
            ? medium ?? large ?? huge ?? scroll!
            : large ?? huge ?? medium ?? scroll!;
  }

  Widget? isSmall(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: context.mediumScreenSize,
        child: small,
      ),
    );
  }
}
