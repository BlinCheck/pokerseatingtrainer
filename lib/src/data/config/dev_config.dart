import 'package:pokerseatingtrainer/src/data/config/build_config.dart';

const devConfig = DevConfig._();

class DevConfig implements BuildConfig {
  const DevConfig._();

  @override
  String get name => 'dev';

  @override
  String get baseUrl => 'localhost'; // TBD
}
