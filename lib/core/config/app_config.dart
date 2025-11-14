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

  /// Lee el ambiente desde --dart-define=ENV=local|dev|prod
  static AppConfig fromEnv() {
    const env = String.fromEnvironment('ENV', defaultValue: 'local');

    switch (env) {
      case 'dev':
        return const AppConfig(
          flavor: Flavor.dev,
          baseUrl: 'https://api-dev.tuapp.com',
          appName: 'Template App DEV',
        );
      case 'prod':
        return const AppConfig(
          flavor: Flavor.prod,
          baseUrl: 'https://api.tuapp.com',
          appName: 'Template App',
        );
      default:
        return const AppConfig(
          flavor: Flavor.local,
          baseUrl: 'http://10.0.2.2:8000', // por ejemplo tu Django local
          appName: 'Template App LOCAL',
        );
    }
  }
}
