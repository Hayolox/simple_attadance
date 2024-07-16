import 'package:flutter/material.dart';
import 'package:mobile_banking/feature/example/presentation/ui/create_location_screen.dart';
import 'package:mobile_banking/feature/example/presentation/ui/example_ui_page.dart';
import 'package:mobile_banking/splash_screen_page.dart';

class ExampleRouter {
  static Route buildSplashRoute() {
    return MaterialPageRoute(
      builder: (context) => const SplashScreenPage(),
    );
  }

  static Route buildExampleRoute() {
    return MaterialPageRoute(
      builder: (context) => const ExamplePage(),
    );
  }

  static Route buildCrateLocationRoute(Object? argument) {
    return MaterialPageRoute(
      builder: (context) => const CreateLocationScreen(),
    );
  }
}
