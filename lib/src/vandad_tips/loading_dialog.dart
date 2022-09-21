import 'package:flutter/material.dart';

typedef CloseDialog = void Function();

CloseDialog showLoadingScreen({
  required BuildContext context,
  required String title,
  CircularProgressIndicator? circularProgressIndicator,
}) {
  final dialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        circularProgressIndicator ?? const CircularProgressIndicator(),
        const SizedBox(
          height: 10,
        ),
        Text(title),
      ],
    ),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => dialog,
  );

  return () => Navigator.of(context).pop();
}
