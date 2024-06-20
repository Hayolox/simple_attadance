import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_banking/common/navigation/router/app_route.dart';
import 'package:mobile_banking/common/navigation/router/router.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    log(settings.name.toString());
    final argument = settings.arguments;

    final Map<String, Route Function(dynamic)> routes = {
      AppRoutes.splashScreen: (_) => ExampleRouter.buildSplashRoute(),
    };

    final Route Function(dynamic)? routeBuilder = routes[settings.name];
    return routeBuilder?.call(argument) ??
        MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
  }
}
