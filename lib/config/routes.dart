import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/menu_management_screen.dart';
import '../screens/reservation_screen.dart';
import '../screens/order_placement_screen.dart';
import '../screens/order_confirmation_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String dashboard = '/dashboard';
  static const String menuManagement = '/menu-management';
  static const String reservation = '/reservation';
  static const String orderPlacement = '/order-placement';
  static const String orderConfirmation = '/order-confirmation';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case menuManagement:
        return MaterialPageRoute(builder: (_) => const MenuManagementScreen());
      case reservation:
        return MaterialPageRoute(builder: (_) => const ReservationScreen());
      case orderPlacement:
        return MaterialPageRoute(builder: (_) => const OrderPlacementScreen());
      case orderConfirmation:
        return MaterialPageRoute(builder: (_) => const OrderConfirmationScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}