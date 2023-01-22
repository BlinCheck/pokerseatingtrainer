import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:pokerseatingtrainer/src/domain/entity/play_state.dart';
import 'package:pokerseatingtrainer/src/domain/entity/settings.dart';
import 'package:pokerseatingtrainer/src/presentation/features/game/game_state.dart';
import 'package:pokerseatingtrainer/src/utils/table_utils.dart';

const missedSeatIndex = 0;

const _maxFishWaitTime = 15000;
const _maxSeatDeactivationTime = 2000;

@injectable
class GameCubit extends Cubit<GameState> {
  GameCubit()
      : super(GameState(
          settings: const Settings(),
          scores: List<int>.filled(9, 0),
        ));

  late final _logger = Logger('GameCubit #${identityHashCode(this)}');

  final _randomGenerator = Random();

  void onPlayButtonPressed() {
    _logger.info('onPlayButtonPressed');

    if (state.playState == PlayState.stopped) {
      _startRound();
    } else {
      _stopGame();
    }
  }

  void onSeatPressed(int seatIndex) {
    final distance = getDistanceToFish(
      seatIndex,
      state.fishIndex!,
      state.settings.seatAmount,
    );

    _logger.info('onSeatPressed: Fish + $distance');

    _processRoundFinish(distance);
  }

  void unpauseGame() {
    _startRound();
  }

  void onSeatAmountChanged(int seatAmount) {
    emit(
      state.copyWith(
        settings: state.settings.copyWith(seatAmount: seatAmount),
        scores: List<int>.filled(seatAmount, 0),
      ),
    );
  }

  Future<void> _startRound() async {
    emit(state.copyWith(playState: PlayState.waitingFish));

    final waitingTime = _randomGenerator.nextInt(_maxFishWaitTime);

    _logger.info('startedRound, waiting time: $waitingTime');

    await Future<void>.delayed(Duration(milliseconds: waitingTime));

    final tablesCount = state.settings.tablesInRow * state.settings.rowsAmount;
    final activeTableIndex = _randomGenerator.nextInt(tablesCount);

    final fishIndex = _randomGenerator.nextInt(state.settings.seatAmount);

    if (state.playState == PlayState.waitingFish) {
      emit(state.copyWith(
        fishIndex: fishIndex,
        nextAvailableIndex: fishIndex + 1,
        activeTableIndex: activeTableIndex,
        seatDeactivationTime: _maxSeatDeactivationTime,
        playState: PlayState.fishActive,
      ));

      _deactivateNextSeat();
    }
  }

  Future<void> _deactivateNextSeat() async {
    final deactivationTime =
        _randomGenerator.nextInt(state.seatDeactivationTime! + 1);

    await Future<void>.delayed(Duration(milliseconds: deactivationTime));

    var nextAvailableIndex = (state.nextAvailableIndex ?? 0) + 1;

    if (nextAvailableIndex >= state.settings.seatAmount) {
      nextAvailableIndex = nextAvailableIndex - state.settings.seatAmount;
    }

    if (state.playState == PlayState.fishActive) {
      if (nextAvailableIndex != state.fishIndex) {
        emit(state.copyWith(
          nextAvailableIndex: nextAvailableIndex,
          seatDeactivationTime: deactivationTime,
        ));

        _deactivateNextSeat();
      } else {
        _logger.info('round is finished');

        _processRoundFinish(missedSeatIndex);
      }
    }
  }

  void _stopGame() {
    emit(
      state
          .clearFields(
            clearFishIndex: true,
            clearNextAvailableIndex: true,
            clearActiveTableIndex: true,
          )
          .copyWith(
            playState: PlayState.stopped,
            showScores: true,
          ),
    );

    emit(state.copyWith(
      scores: List<int>.filled(state.settings.seatAmount, 0),
    ));

    _logger.info('stopped game');
  }

  void _processRoundFinish(int clickedSeat) {
    final newScores = state.scores;

    newScores[clickedSeat] = state.scores[clickedSeat] + 1;

    emit(
      state
          .clearFields(
            clearFishIndex: true,
            clearNextAvailableIndex: true,
            clearActiveTableIndex: true,
          )
          .copyWith(
            clickedSeat: clickedSeat,
            playState: PlayState.paused,
            scores: newScores,
          ),
    );
  }
}
