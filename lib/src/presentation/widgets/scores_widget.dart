import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_resources/locale_keys.g.dart';

class ScoresWidget extends StatelessWidget {
  const ScoresWidget(this.scores, {super.key});

  final List<int> scores;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scores.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final positionName = index == 0
            ? LocaleKeys.missed.tr()
            : '${LocaleKeys.fish.tr()}+$index';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            '$positionName: ${scores[index]}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      },
    );
  }
}
