import 'package:codeofland_website/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

enum ElevatedButtonSize {
  low(90, 30),
  normal(120, 40),
  large(150, 50),
  circle(60, 60),
  ;

  final double width;
  final double height;
  const ElevatedButtonSize(this.width, this.height);

  Size get size => Size(width, height);
}

extension ElevationButtonStyleExtension on CustomButtonStyle {
  ButtonStyle size({Size? minimum, Size? fixed, Size? maximum}) => copyWith(
        minimumSize: MaterialStateProperty.all(minimum),
        maximumSize: MaterialStateProperty.all(maximum),
        fixedSize: MaterialStateProperty.all(fixed),
      );
}

extension ElevationButtonExtension on ElevatedButton {
  Widget size(double widthFactor, double heightFactor,
          {AlignmentGeometry alignment = Alignment.center}) =>
      FractionallySizedBox(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: alignment,
        child: this,
      );
}
