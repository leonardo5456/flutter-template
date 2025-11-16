import 'core/config/app_config.dart';
import 'core/storage/shared_prefs_service.dart';

late final AppConfig appConfig;

/// Inicialización común para todos los ambientes
Future<void> bootstrap() async {
  appConfig = AppConfig.fromEnv();
  await SharedPrefsService.init();

  // Aquí podrías inicializar:
  // - Logs
  // - Servicios locales
  // - Storage (SharedPreferences)
}
