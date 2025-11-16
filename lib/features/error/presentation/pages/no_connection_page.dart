import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No internet connection',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
