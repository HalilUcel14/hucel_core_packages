import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget toVisible(bool value, {double? height}) => value
      ? this
      : SizedBox(
          height: height,
        );
}
