import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget toVisible(bool value, {double? height}) => value
      ? this
      : SizedBox(
          height: height,
        );
}
