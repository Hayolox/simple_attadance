import 'package:flutter/material.dart';
import 'package:mobile_banking/feature/example/presentation/ui/example_ui_page.dart';

class ExampleRouter {
  static Route buildSplashRoute() {
    return MaterialPageRoute(
      builder: (context) => const ExamplePage(),
    );
  }

  static Route buildExampleRoute() {
    return MaterialPageRoute(
      builder: (context) => const ExamplePage(),
    );
  }
}
