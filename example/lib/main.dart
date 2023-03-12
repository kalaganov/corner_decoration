import 'package:flutter/material.dart';

import 'demo_grid.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.grey[800]),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xfff0f0f0),
        appBar: AppBar(title: const Text('Corner Decoration Demo')),
        body: const DemoGrid(),
      ),
    );
  }
}
