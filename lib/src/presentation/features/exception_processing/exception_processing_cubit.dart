import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_resources/locale_keys.g.dart';
import 'package:pokerseatingtrainer/src/presentation/features/exception_processing/exception_processing_state.dart';

@singleton
class ExceptionProcessingCubit extends Cubit<ExceptionProcessingState> {
  ExceptionProcessingCubit() : super(const ExceptionProcessingState());

  void processException(Exception exception) {
    emit(ExceptionProcessingState(
      alertTitle: LocaleKeys.error.tr(),
      alertMessage: LocaleKeys.somethingWrong.tr(),
    ));

    emit(const ExceptionProcessingState()); // so we can show same alert again
  }
}
