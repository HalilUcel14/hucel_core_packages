import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

/// https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/rendering-bullet-points-in-flutter/rendering-bullet-points-in-flutter.md
Widget bulletPoints({
  String? prefix,
  required List<String> bulletPoints,
  String? suffix,
  required TextStyle textStyle,
}) {
  final bullet = utf8.decode([0xE2, 0x80, 0xA2]);
  var text = prefix != null ? '$prefix\n\n' : '';
  bulletPoints.map((e) => '$bullet $e\n').forEach((element) {
    text += element;
  });
  text += suffix != null ? '\n$suffix' : '';
  return Text(text, style: textStyle);
}
