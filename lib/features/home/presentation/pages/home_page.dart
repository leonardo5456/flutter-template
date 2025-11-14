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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bienvenido a tu plantilla base',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text('Ambiente: $flavorLabel'),
            ),
            const SizedBox(height: 24),
            Text(
              'Aquí puedes empezar a montar tus features',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
