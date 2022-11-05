import 'package:flutter/material.dart';

Future<void> showTextDialog({
  required BuildContext context,
  required String text,
  double? radius,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 12),
          ),
          side: const BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        backgroundColor: Colors.black.withAlpha(150),
        titleTextStyle: whiteTextStyle(14),
        contentTextStyle: whiteTextStyle(12),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

TextStyle whiteTextStyle(double fs) =>
    TextStyle(color: Colors.white, fontSize: fs);
