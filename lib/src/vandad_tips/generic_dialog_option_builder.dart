import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder builder,
}) {
  final options = builder();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: options.keys.map(
          (e) {
            final T value = options[e];
            return TextButton(
              onPressed: () => Navigator.of(context).pop(value),
              child: Text(e),
            );
          },
        ).toList(),
      );
    },
  );
}
