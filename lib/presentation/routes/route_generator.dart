import 'package:flutter/material.dart';
import 'app_routes.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/setup_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/pos/pos_page.dart';
import '../pages/menu/menu_management_page.dart';
import '../pages/orders/order_management_page.dart';
import '../pages/settings/settings_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(), // Temporary splash redirect
          settings: settings,
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

      case AppRoutes.setup:
        return MaterialPageRoute(
          builder: (_) => const SetupPage(),
          settings: settings,
        );

      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
          settings: settings,
        );

      case AppRoutes.pos:
        return MaterialPageRoute(
          builder: (_) => const PosPage(),
          settings: settings,
        );

      case AppRoutes.menuManagement:
        return MaterialPageRoute(
          builder: (_) => const MenuManagementPage(),
          settings: settings,
        );

      case AppRoutes.orderManagement:
        return MaterialPageRoute(
          builder: (_) => const OrderManagementPage(),
          settings: settings,
        );

      case AppRoutes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
          settings: settings,
        );

      // Add more routes as needed

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
          settings: settings,
        );
    }
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              '404 - Page Not Found',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}