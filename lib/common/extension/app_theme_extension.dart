import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

extension HexColorExtension on Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }

    return int.tryParse(hexColor, radix: 16) ?? 0xFFFFFFFF;
  }

  static Color fromHex(String hexColor) {
    return Color(_getColorFromHex(hexColor));
  }
}

extension AppBuildContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
  double get textScaleFactor => mediaQuery.textScaleFactor;
  EdgeInsets get padding => mediaQuery.padding;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;

  String animationPath(String path) {
    return "assets/animations/$path.json";
  }

  Widget loading() {
    return Center(
      child: Lottie.asset(
        animationPath(
          'animation-loading-state',
        ),
        delegates: LottieDelegates(
          text: (initialText) => '**$initialText**',
          values: [
            ValueDelegate.color(
              const ['Ellipse 1422', ''],
              value: colors.secondary,
            ),
            ValueDelegate.color(
              const ['Ellipse 1421', ''],
              value: colors.primary.withOpacity(0.5),
            ),
            ValueDelegate.color(
              const ['Ellipse 1420', ''],
              value: colors.primary,
            ),
            ValueDelegate.color(
              const ['Ellipse 1423', ''],
              value: colors.primary.withOpacity(0.5),
            ),
            ValueDelegate.color(
              const ['Ellipse 1419', ''],
              value: colors.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
