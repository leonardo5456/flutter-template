import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_notifier.dart';
import '../../../../shared/widgets/app_icon.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    final themeMode = themeNotifier.themeMode;
    final seedColor = themeNotifier.seedColor;

    // Algunos colores predefinidos para escoger
    final colorOptions = <Color>[
      Colors.deepPurple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.teal,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const AppIcon(Icons.dark_mode),
            title: const Text('Theme'),
            subtitle: const Text('Light, dark, or system default'),
          ),
          Column(
            children: [
              RadioListTile<ThemeMode>(
                title: const Text('System'),
                value: ThemeMode.system,
                groupValue: themeMode,
                onChanged: (value) {
                  if (value != null) {
                    themeNotifier.setThemeMode(value);
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Light'),
                value: ThemeMode.light,
                groupValue: themeMode,
                onChanged: (value) {
                  if (value != null) {
                    themeNotifier.setThemeMode(value);
                  }
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text('Dark'),
                value: ThemeMode.dark,
                groupValue: themeMode,
                onChanged: (value) {
                  if (value != null) {
                    themeNotifier.setThemeMode(value);
                  }
                },
              ),
  ],
          ),
          const SizedBox(height: 24),
          const ListTile(
            leading: AppIcon(Icons.color_lens),
            title: Text('Primary Color'),
            subtitle: Text('Affects icons, buttons, and MD3 components'),
          ),
          Wrap(
            spacing: 12,
            children: colorOptions.map((color) {
              final isSelected = color.value == seedColor.value;
              return GestureDetector(
                onTap: () => themeNotifier.setSeedColor(color),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 3,
                          )
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
