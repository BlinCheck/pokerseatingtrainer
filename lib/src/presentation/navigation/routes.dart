import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_cubit.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_screen.dart';
import 'package:pokerseatingtrainer/src/presentation/utils/cubit_provider.dart';

final routerDelegate = BeamerDelegate(
  initialPath: GameScreen.screenName,
  locationBuilder: SimpleLocationBuilder(
      routes: <String, Widget Function(BuildContext, BeamState)>{
        GameScreen.screenName: (c, s) =>
            const CubitProvider<GameCubit>(child: GameScreen()),
      }),
);
