import 'package:flutter/material.dart';

extension InputDecorationExtension on InputDecoration {
  static const kTextColor = Color(0xFF757575);
  InputDecoration myInputDecoration({double? size, Color? textColor}) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: size ?? 16),
      border: _outlineInputBorder(size ?? 16),
      focusedBorder: _outlineInputBorder(size ?? 16),
      enabledBorder: _outlineInputBorder(size ?? 16),
    );
  }

  OutlineInputBorder _outlineInputBorder(double value) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(value),
      borderSide: const BorderSide(color: kTextColor),
    );
  }
}
