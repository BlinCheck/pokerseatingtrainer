import 'package:flutter/material.dart';
import 'package:pokerseatingtrainer/src/presentation/features/app_theme/app_theme_source.dart';
import 'package:provider/provider.dart';

class AppThemeWidget extends StatelessWidget {
  const AppThemeWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  static AppThemeSource of(BuildContext context) {
    return Provider.of<AppThemeSource>(context, listen: false);
  }

  Future<AppThemeSource> _loadAppTheme(BuildContext context) async =>
      AppThemeSource();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadAppTheme(context),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Provider<AppThemeSource>(
                lazy: false,
                create: (_) => snapshot.data as AppThemeSource,
                child: child,
              )
            : const SizedBox();
      },
    );
  }
}
