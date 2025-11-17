import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:flutter_template/core/theme/theme_notifier.dart';
import 'package:flutter_template/features/settings/presentation/pages/settings_page.dart';

void main() {
  Widget _buildTestWidget() {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            home: const SettingsPage(),
          );
        },
      ),
    );
  }

  testWidgets('SettingsPage shows theme section and primary color section',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildTestWidget());
    await tester.pumpAndSettle();

    expect(find.text('Theme'), findsOneWidget);
    expect(find.text('Primary Color'), findsOneWidget);
  });

  testWidgets('Changing theme radio updates ThemeNotifier',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildTestWidget());
    await tester.pumpAndSettle();

    final BuildContext context = tester.element(find.byType(SettingsPage));
    final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);

    // Por defecto debería ser system
    expect(themeNotifier.themeMode, ThemeMode.system);

    // Tap en 'Dark'
    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();

    expect(themeNotifier.themeMode, ThemeMode.dark);
  });
}
