import 'package:flutter/material.dart';

Future<void> showAppDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmLabel = 'OK',
}) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(confirmLabel),
          ),
        ],
      );
    },
  );
}
