import '../config/flavor.dart';
import '../../bootstrap.dart';
import '../config/env.dart';

class AppLogger {
  static void log(String message) {
    if (appConfig.env != Env.prod) {
      // ignore: avoid_print
      print('[LOG] $message');
    }
  }

  static void error(String message, [Object? error, StackTrace? stack]) {
    // ignore: avoid_print
    print('[ERROR] $message');
    if (error != null) {
      print('  $error');
    }
    if (stack != null) {
      print(stack);
    }
  }
}
