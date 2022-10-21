import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle? get coBold => this?.copyWith(fontWeight: FontWeight.bold);
  TextStyle? size(double value, {double? minSize, double? maxSize}) =>
      this?.copyWith(
        fontSize: minSize != null
            ? value < minSize
                ? minSize
                : value
            : maxSize != null
                ? value > maxSize
                    ? maxSize
                    : value
                : value,
      );
  TextStyle? color(Color color) => this?.copyWith(color: color);

  TextStyle? get coWhite => this?.copyWith(color: Colors.white);
  TextStyle? get coBoldWhite =>
      this?.copyWith(fontWeight: FontWeight.bold, color: Colors.white);
  //

}
