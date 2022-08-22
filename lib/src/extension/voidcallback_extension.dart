import 'package:flutter/material.dart';

extension ToTextButton on VoidCallback {
  // https://github.com/vandadnp/flutter-tips-and-tricks/blob/main/tipsandtricks/extending-functions-in-dart/extending-functions-in-dart.md
  TextButton toTextButton(String title, {TextStyle? style}) {
    return TextButton(
      onPressed: this,
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
