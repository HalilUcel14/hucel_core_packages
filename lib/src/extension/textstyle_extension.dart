import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get coBoldBlack => copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      );
  TextStyle coBoldBlackSize(double size) => copyWith(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.black,
      );
  TextStyle get coBoldAmber => copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.amber[900],
      );
  TextStyle get coBlack => copyWith(
        color: Colors.black,
      );
  TextStyle coBlackSize(double size) => copyWith(
        color: Colors.black,
        fontSize: size,
      );
}
