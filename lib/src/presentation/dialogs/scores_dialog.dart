import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_resources/locale_keys.g.dart';
import 'package:pokerseatingtrainer/src/presentation/widgets/scores_widget.dart';

Future<void> showScoresDialog({
  required BuildContext context,
  required List<int> scores,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text(
        LocaleKeys.results.tr(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      content: SizedBox(
        width: 200,
        child: ScoresWidget(scores),
      ),
      actions: [
        TextButton(
          child: Text(
            LocaleKeys.ok.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Theme.of(context).primaryColor, fontSize: 16),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
