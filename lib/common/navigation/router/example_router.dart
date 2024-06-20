import 'package:flutter/material.dart';
import 'package:mobile_banking/feature/example/example.dart';

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
