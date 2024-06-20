import 'package:flutter/material.dart';
import 'package:mobile_banking/core/network/navigator_services.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

abstract class NavigationHelper {
  Future<dynamic>? navigationTo(String routeName, {dynamic arguments});
  Future<dynamic>? navigationReplaceTo(String routeName, {dynamic arguments});
  Future<dynamic>? navigationReplaceAndRemoveUntilTo(
    String routeName, {
    dynamic arguments,
  });
  void pop<T extends Object?>([T? result]);
}

class NavigationHelperImpl extends NavigationHelper {
  static final navigatorKey = sl<NavigationService>().navigatorKey;
  @override
  Future? navigationTo(String routeName, {arguments}) =>
      navigatorKey.currentState?.pushNamed(
        routeName,
        arguments: arguments,
      );

  @override
  Future? navigationReplaceTo(String routeName, {arguments}) =>
      navigatorKey.currentState?.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );

  @override
  Future? navigationReplaceAndRemoveUntilTo(String routeName, {arguments}) =>
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );

  @override
  void pop<T extends Object?>([T? result]) =>
      navigatorKey.currentState!.pop(result);
}
