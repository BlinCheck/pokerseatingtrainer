import 'package:beamer/beamer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_theme/app_theme_widget.dart';
import 'package:pokerseatingtrainer/src/presentation/features/exception_processing/exception_processing_cubit.dart';
import 'package:pokerseatingtrainer/src/presentation/navigation/routes.dart';
import 'package:pokerseatingtrainer/src/presentation/utils/cubit_provider.dart';

class PokerSeatingTrainerApplication extends StatelessWidget {
  const PokerSeatingTrainerApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      theme: AppThemeWidget.of(context).theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) => CubitProvider<ExceptionProcessingCubit>(
        child: child,
      ),
    );
  }
}
