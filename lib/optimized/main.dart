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
      title: 'Tree Shaking Demo - optimized',
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
      appBar: AppBar(title: const Text('Tree Shaking Demo - optimized')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showPlatformNotification(context),
          child: const Text('Open notification'),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _showPlatformNotification(BuildContext context) {
    final notification = PlatformNotification(context);

    notification.show();
  }
}
