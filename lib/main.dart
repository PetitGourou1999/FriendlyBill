import 'package:flutter/material.dart';

import './src/routing/services/navigation_service.dart';

void main() {
  NavigationService.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: NavigationService.router,
    );
  }
}
