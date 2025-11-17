import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_template/core/theme/theme_notifier.dart';

void main() {
  group('ThemeNotifier', () {
    late ThemeNotifier themeNotifier;

    setUp(() {
      themeNotifier = ThemeNotifier();
    });

    test('initial values are system mode and a default seed color', () {
      expect(themeNotifier.themeMode, ThemeMode.system);
      // Cambia este color si en tu ThemeNotifier usas otro por defecto
      expect(themeNotifier.seedColor, isA<Color>());
    });

    test('setThemeMode changes themeMode', () {
      themeNotifier.setThemeMode(ThemeMode.dark);
      expect(themeNotifier.themeMode, ThemeMode.dark);

      themeNotifier.setThemeMode(ThemeMode.light);
      expect(themeNotifier.themeMode, ThemeMode.light);
    });

    test('setSeedColor changes seedColor', () {
      final previous = themeNotifier.seedColor;
      final newColor = Colors.green;

      themeNotifier.setSeedColor(newColor);

      expect(themeNotifier.seedColor, newColor);
      expect(themeNotifier.seedColor, isNot(previous));
    });
  });
}
