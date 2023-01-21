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
  });

  final Settings settings;
  final PlayState playState;
  final int? fishIndex;
  final int? nextAvailableIndex;
  final int? activeTableIndex;
  final int? seatDeactivationTime;

  GameState copyWith({
    Settings? settings,
    PlayState? playState,
    int? fishIndex,
    int? nextAvailableIndex,
    int? activeTableIndex,
    int? seatDeactivationTime,
  }) {
    return GameState(
      settings: settings ?? this.settings,
      playState: playState ?? this.playState,
      fishIndex: fishIndex ?? this.fishIndex,
      nextAvailableIndex: nextAvailableIndex ?? this.nextAvailableIndex,
      activeTableIndex: activeTableIndex ?? this.activeTableIndex,
      seatDeactivationTime: seatDeactivationTime ?? this.seatDeactivationTime,
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
      ];
}
