import 'package:code_base_provider_flutter/view/main/main_screen.dart';
import 'package:code_base_provider_flutter/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> routeBuilder(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.main:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }

  static void goToMainScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        RoutesName.main, (Route<dynamic> route) => false);
  }
}
