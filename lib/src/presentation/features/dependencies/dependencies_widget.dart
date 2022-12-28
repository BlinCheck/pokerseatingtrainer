import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokerseatingtrainer/src/data/config/build_config.dart';
import 'package:pokerseatingtrainer/src/data/config/dev_config.dart';
import 'package:pokerseatingtrainer/src/presentation/features/dependencies/dependencies_widget.config.dart';
import 'package:provider/provider.dart';

const _buildConfigs = [devConfig];

@injectableInit
Future<GetIt> _configureDependencies() async {
  const configName = String.fromEnvironment('ENV');

  final buildConfig =
      _buildConfigs.firstWhere((config) => config.name == configName);

  final dependencyContainer = GetIt.asNewInstance()
    ..registerFactory<BuildConfig>(() => buildConfig);

  return $initGetIt(dependencyContainer, environment: buildConfig.name);
}

class DependenciesWidget extends StatelessWidget {
  const DependenciesWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  static GetIt of(BuildContext context) {
    return Provider.of<GetIt>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _configureDependencies(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Provider<GetIt>(
                lazy: false,
                create: (_) => snapshot.data as GetIt,
                child: child,
              )
            : const SizedBox();
      },
    );
  }
}
