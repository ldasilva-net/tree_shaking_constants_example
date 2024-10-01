import 'package:flutter/material.dart';

import 'utils/platform_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tree Shaking Demo - not optimized',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tree Shaking Demo - not optimized')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showPlatformDialog(context),
          child: const Text('Open notification'),
        ),
      ),
    );
  }

  void _showPlatformDialog(BuildContext context) {
    final notification = PlatformNotification(context);

    notification.show();
  }
}
