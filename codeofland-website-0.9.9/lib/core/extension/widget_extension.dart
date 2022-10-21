import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';

extension WidgetScrolledExtension on Widget {
  Widget isWidthScrolled(BuildContext context, double minWidth) {
    return context.width > minWidth
        ? this
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: this,
          );
  }
}
