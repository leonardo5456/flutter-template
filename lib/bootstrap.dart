import 'core/config/app_config.dart';

late final AppConfig appConfig;

/// Inicialización común para todos los ambientes
Future<void> bootstrap() async {
  appConfig = AppConfig.fromEnv();

  // Aquí podrías inicializar:
  // - Logs
  // - Servicios locales
  // - Storage (SharedPreferences)
}
