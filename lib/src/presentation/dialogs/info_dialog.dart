import 'package:flutter/material.dart';

Future<void> showInfoDialog({
  required BuildContext context,
  required String title,
  required String message,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
    ),
  );
}
