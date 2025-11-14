import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const AppIcon(this.icon, {super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Icon(icon, size: size, color: color);
  }
}
