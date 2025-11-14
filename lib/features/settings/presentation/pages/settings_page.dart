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
        title: const Text('Configuración'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const AppIcon(Icons.dark_mode),
            title: const Text('Tema'),
            subtitle: const Text('Claro, oscuro o según el sistema'),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<ThemeMode>(
                  title: const Text('Sistema'),
                  value: ThemeMode.system,
                  groupValue: themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeNotifier.setThemeMode(value);
                    }
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<ThemeMode>(
                  title: const Text('Claro'),
                  value: ThemeMode.light,
                  groupValue: themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeNotifier.setThemeMode(value);
                    }
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<ThemeMode>(
                  title: const Text('Oscuro'),
                  value: ThemeMode.dark,
                  groupValue: themeMode,
                  onChanged: (value) {
                    if (value != null) {
                      themeNotifier.setThemeMode(value);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const ListTile(
            leading: AppIcon(Icons.color_lens),
            title: Text('Color principal'),
            subtitle: Text('Afecta iconos, botones y componentes MD3'),
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
