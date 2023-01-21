import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Settings extends Equatable {
  const Settings({
    this.seatAmount = 6,
    this.tablesInRow = 4,
    this.rowsAmount = 3,
  });

  final int seatAmount;
  final int tablesInRow;
  final int rowsAmount;

  Settings copyWith({
    int? seatAmount,
    int? tablesInRow,
    int? rowsAmount,
  }) {
    return Settings(
      seatAmount: seatAmount ?? this.seatAmount,
      tablesInRow: tablesInRow ?? this.tablesInRow,
      rowsAmount: rowsAmount ?? this.rowsAmount,
    );
  }

  @override
  List<Object?> get props => [seatAmount, tablesInRow, rowsAmount];
}
