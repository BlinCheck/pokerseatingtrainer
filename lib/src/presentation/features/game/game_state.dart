import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/domain/entity/play_state.dart';
import 'package:pokerseatingtrainer/src/domain/entity/settings.dart';

@immutable
class GameState extends Equatable {
  const GameState({
    required this.settings,
    this.playState = PlayState.stopped,
    this.fishIndex,
    this.nextAvailableIndex,
    this.activeTableIndex,
    this.seatDeactivationTime,
    this.clickedSeat,
  });

  final Settings settings;
  final PlayState playState;
  final int? fishIndex;
  final int? nextAvailableIndex;
  final int? activeTableIndex;
  final int? seatDeactivationTime;
  final int? clickedSeat;

  GameState copyWith({
    Settings? settings,
    PlayState? playState,
    int? fishIndex,
    int? nextAvailableIndex,
    int? activeTableIndex,
    int? seatDeactivationTime,
    int? clickedSeat,
  }) {
    return GameState(
      settings: settings ?? this.settings,
      playState: playState ?? this.playState,
      fishIndex: fishIndex ?? this.fishIndex,
      nextAvailableIndex: nextAvailableIndex ?? this.nextAvailableIndex,
      activeTableIndex: activeTableIndex ?? this.activeTableIndex,
      seatDeactivationTime: seatDeactivationTime ?? this.seatDeactivationTime,
      clickedSeat: clickedSeat,
    );
  }

  GameState clearFields({
    bool clearFishIndex = false,
    bool clearNextAvailableIndex = false,
    bool clearActiveTableIndex = false,
  }) {
    return GameState(
      settings: settings,
      playState: playState,
      seatDeactivationTime: seatDeactivationTime,
      fishIndex: clearFishIndex ? null : fishIndex,
      nextAvailableIndex: clearNextAvailableIndex ? null : nextAvailableIndex,
      activeTableIndex: clearActiveTableIndex ? null : activeTableIndex,
      clickedSeat: null,
    );
  }

  @override
  List<Object?> get props => [
        settings,
        playState,
        fishIndex,
        nextAvailableIndex,
        activeTableIndex,
        seatDeactivationTime,
        clickedSeat,
      ];
}
