import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/base/cubit_state.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_resources/locale_keys.g.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_cubit.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_state.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  static const screenName = '/game';

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends CubitState<GameScreen, GameState, GameCubit> {
  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(LocaleKeys.appName.tr()),
      ),
    );
  }
}
