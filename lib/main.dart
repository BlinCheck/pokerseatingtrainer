import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/application.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_theme/app_theme_widget.dart';
import 'package:pokerseatingtrainer/src/presentation/features/dependencies/dependencies_widget.dart';
import 'package:pokerseatingtrainer/src/presentation/features/localization/localization_widget.dart';
import 'package:pokerseatingtrainer/src/utils/logger_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupPrintLogger();
  runApp(_buildAppWidgetTree());
}

Widget _buildAppWidgetTree() {
  return const DependenciesWidget(
    child: LocalizationWidget(
      child: AppThemeWidget(
        child: PokerSeatingTrainerApplication(),
      ),
    ),
  );
}
