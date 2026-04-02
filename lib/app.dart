import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/routes.dart';

class AsdRestaurantApp extends StatelessWidget {
  const AsdRestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'asd Restaurant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}