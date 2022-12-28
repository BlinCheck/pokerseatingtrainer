import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_resources/locale_keys.g.dart';

Future<void> showInfoDialog({
  required BuildContext context,
  required String title,
  required String message,
}) async {
  return showCupertinoDialog<void>(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(LocaleKeys.ok.tr()),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
