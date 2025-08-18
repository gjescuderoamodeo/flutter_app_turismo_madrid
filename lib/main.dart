import 'package:flutter/material.dart';
import '../screens/screens.dart';
import 'router/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turismo madrid',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
