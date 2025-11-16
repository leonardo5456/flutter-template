import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  const Error404Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '404 - Page not found',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
