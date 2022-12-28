import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ExceptionProcessingState extends Equatable {
  const ExceptionProcessingState({
    this.alertTitle,
    this.alertMessage,
  });

  final String? alertTitle;
  final String? alertMessage;

  @override
  List<Object?> get props => [alertTitle, alertMessage];
}
