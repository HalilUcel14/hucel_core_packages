import 'package:flutter/material.dart';

class AppUtils {
  static void snackBarShow(BuildContext context, {required String text}) {
    ScaffoldMessengerState().showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
