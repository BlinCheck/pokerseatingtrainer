import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/base/cubit_widget.dart';
import 'package:pokerseatingtrainer/src/presentation/dialogs/info_dialog.dart';
import 'package:pokerseatingtrainer/src/presentation/features/exception_processing/exception_processing_cubit.dart';
import 'package:pokerseatingtrainer/src/presentation/features/exception_processing/exception_processing_state.dart';

class ExceptionProcessingWidget
    extends CubitWidget<ExceptionProcessingState, ExceptionProcessingCubit> {
  const ExceptionProcessingWidget({this.child, Key? key}) : super(key: key);

  final Widget? child;

  @override
  void onStateChanged(BuildContext context, ExceptionProcessingState state) {
    if (state.alertTitle != null && state.alertMessage != null) {
      showInfoDialog(
        context: context,
        title: state.alertTitle!,
        message: state.alertMessage!,
      );
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return child ?? const SizedBox();
  }
}
