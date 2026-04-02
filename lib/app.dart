import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'config/routes.dart';

class ResshopApp extends StatelessWidget {
  const ResshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resshop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

// Keeping the old class name as an alias for backward compatibility
typedef AsdRestaurantApp = ResshopApp;