import 'flavor.dart';

class AppConfig {
  final Flavor flavor;
  final String baseUrl;
  final String appName;

  const AppConfig({
    required this.flavor,
    required this.baseUrl,
    required this.appName,
  });

  /// choose environment from --dart-define=FLAVOR=local|dev|test|prod
  static AppConfig fromEnv() {
    const env = String.fromEnvironment('FLAVOR', defaultValue: 'local');

    switch (env) {
      case 'dev':
        return const AppConfig(
          flavor: Flavor.dev,
          baseUrl: 'https://api-dev.tuapp.com',
          appName: 'Template App DEV',
        );

      case 'test':
        return const AppConfig(
          flavor: Flavor.test,
          baseUrl: 'https://api-test.tuapp.com',
          appName: 'Template App TEST',
        );

      case 'prod':
        return const AppConfig(
          flavor: Flavor.prod,
          baseUrl: 'https://api.tuapp.com',
          appName: 'Template App',
        );

      default: // LOCAL
        return const AppConfig(
          flavor: Flavor.local,
          baseUrl: 'http://10.0.2.2:8000', // django local o lo que quieras
          appName: 'Template App LOCAL',
        );
    }
  }
}
