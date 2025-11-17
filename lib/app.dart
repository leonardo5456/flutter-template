import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_notifier.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (_, themeNotifier, __) {
          final seed = themeNotifier.seedColor;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Template App',
            themeMode: themeNotifier.themeMode,
            theme: AppTheme.light(seed),
            darkTheme: AppTheme.dark(seed),
            onGenerateRoute: AppRouter.onGenerateRoute,
            // initialRoute: AppRoutes.home,
            initialRoute: AppRoutes.splash,
          );
        },
      ),
    );
  }
}
