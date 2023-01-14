import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/base/cubit_state.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_cubit.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_state.dart';
import 'package:pokerseatingtrainer/src/presentation/widgets/table_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  static const screenName = '/game';

  @override
  State<StatefulWidget> createState() => GameScreenState();
}

class GameScreenState extends CubitState<GameScreen, GameState, GameCubit> {
  @override
  Widget buildWidget(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TableWidget(
          seatAmount: 6,
          fishIndex: 2,
          nextAvailableIndex: 0,
        ),
      ),
    );
  }
}
