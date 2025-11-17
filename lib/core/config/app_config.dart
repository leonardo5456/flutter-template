import 'flavor.dart';
import 'env.dart';

class AppConfig {
  final Env env;  
  final Flavor flavor;
  final String baseUrl;
  final String appName;

  const AppConfig({
    required this.env,
    required this.flavor,
    required this.baseUrl,
    required this.appName,
  });

  /// choose environment from --dart-define=FLAVOR=local|dev|test|prod
  static AppConfig fromEnv() {
    const envStr    = String.fromEnvironment('ENV',    defaultValue: 'local');
    const flavorStr = String.fromEnvironment('FLAVOR', defaultValue: 'config1');

    final env    = parseEnv(envStr);
    final flavor = _parseFlavor(flavorStr);

    switch (env) {
      case Env.local:
        return AppConfig(
          env: env,
          flavor: flavor,
          baseUrl: 'https://api-test.tuapp.com',
          appName: _appNameFor(flavor, env),
        );
      case Env.dev:
        return AppConfig(
          env: env,
          flavor: flavor,
          baseUrl: 'https://api-dev.tuapp.com',
          appName: _appNameFor(flavor, env),
        );

      case Env.test:
        return AppConfig(
          env: env,
          flavor: flavor,
          baseUrl: 'https://api-test.tuapp.com',
          appName: _appNameFor(flavor, env),
        );
      case Env.prod:
        return AppConfig(
          env: env,
          flavor: flavor,
          baseUrl: 'https://api.tuapp.com',
          appName: _appNameFor(flavor, env),
        );

      default: // LOCAL
        return AppConfig(
          env: env,
          flavor: flavor,
          baseUrl: 'http://10.0.2.2:8000', // django local o lo que quieras
          appName: _appNameFor(flavor, env),
        );
    }
  }

    static Flavor _parseFlavor(String value) {
    switch (value.toLowerCase()) {
      case 'config2':
        return Flavor.config2;
      case 'config3':
        return Flavor.config3;
      default:
        return Flavor.config1;
    }
  }

  static String _appNameFor(Flavor flavor, Env env) {
    final base = switch (flavor) {
      Flavor.config1 => 'Config 1',
      Flavor.config2 => 'Config 2',
      Flavor.config3 => 'Config 3',
    };

    // Si quieres que se vea en debug qué env es:
    if (env == Env.prod) return base;
    return '$base (${envName(env)})';
  }
}
