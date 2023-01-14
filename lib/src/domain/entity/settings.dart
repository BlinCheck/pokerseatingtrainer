import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Settings extends Equatable {
  const Settings({
    this.seatAmount = 6,
  });

  final int seatAmount;

  Settings copyWith({int? seatAmount}) {
    return Settings(seatAmount: seatAmount ?? this.seatAmount);
  }

  @override
  List<Object?> get props => [seatAmount];
}