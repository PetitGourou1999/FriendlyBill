import 'package:flutter/material.dart';

import 'src/features/theme/services/theme_provider.dart';
import 'src/utils/routing/services/navigation_provider.dart';

void main() async {
  await initializeServices();
  runApp(const MyApp());
}

Future<void> initializeServices() async {
  NavigationProvider.instance;
  await ThemeProvider.instance;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: NavigationProvider.router,
      theme: ThemeProvider.theme,
    );
  }
}
