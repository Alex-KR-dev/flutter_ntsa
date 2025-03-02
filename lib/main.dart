// 📌 File: lib/main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';  // Import the router configuration

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NTSA GVCU App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerConfig: router, // Use our GoRouter configuration
    );
  }
}