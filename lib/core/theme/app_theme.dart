import 'package:flutter/material.dart';

class AppTheme {
  // Color semilla por defecto
  static const Color defaultSeed = Colors.deepPurple;

  static ColorScheme colorSchemeFromSeed(Color seed, {Brightness? brightness}) {
    return ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness ?? Brightness.light,
    );
  }

  static ThemeData light(Color seed) {
    final scheme = colorSchemeFromSeed(seed, brightness: Brightness.light);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: scheme.primary),
    );
  }

  static ThemeData dark(Color seed) {
    final scheme = colorSchemeFromSeed(seed, brightness: Brightness.dark);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: scheme.primary),
    );
  }
}
