import 'package:flutter/material.dart';

import '../../../../bootstrap.dart';
import '../../../../core/config/flavor.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/app_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = appConfig.flavor;
    final flavorLabel = flavorName(flavor);

    return Scaffold(
      appBar: AppBar(
        title: Text(appConfig.appName),
        actions: [
          IconButton(
            icon: const AppIcon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.settings);
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Base Template Flutter',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Chip(
                  label: Text('Environment: $flavorLabel'),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add and build your features',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),

                // Demo buttons
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'UI Demo Screens',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 12),

                _DemoButton(
                  label: 'Initial Screen: Onboarding',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.onboarding),
                ),
                _DemoButton(
                  label: 'Language Preferences',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.language),
                ),
                _DemoButton(
                  label: 'Login / Sign up / Forgot password',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.login),
                ),
                _DemoButton(
                  label: 'Verification Code',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.verificationCode),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DemoButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onTap,
          child: Text(label),
        ),
      ),
    );
  }
}
