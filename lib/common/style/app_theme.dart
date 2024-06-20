import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_banking/common/extension/extension.dart';
import 'package:mobile_banking/common/style/app_color_palette.dart';

// Styling for text
final TextTheme _textTheme = TextTheme(
  headlineSmall: TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  titleLarge: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  titleMedium: TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  titleSmall: TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  bodyLarge: TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  bodyMedium: TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  bodySmall: TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  labelMedium: TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
  labelSmall: TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: AppColorPalette.neutralColorBlack,
  ),
);

// styling for elevated button
ButtonStyle elevatedButtonStyle(BuildContext context) =>
    ElevatedButton.styleFrom(
      backgroundColor: AppColorPalette.primaryColorSkyDark,
      foregroundColor: AppColorPalette.neutralColorWhite,
      disabledBackgroundColor: AppColorPalette.neutralColorGray,
      disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
      minimumSize: Size(MediaQuery.sizeOf(context).width, 48),
      maximumSize: Size(MediaQuery.sizeOf(context).width, 48),
      textStyle: context.textTheme.titleSmall,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );

ButtonStyle outlinedButtonStyle(BuildContext context) =>
    OutlinedButton.styleFrom(
      backgroundColor: AppColorPalette.neutralColorWhite,
      foregroundColor: AppColorPalette.primaryColorSkyDark,
      side: const BorderSide(color: AppColorPalette.primaryColorSkyDark),
      disabledBackgroundColor: AppColorPalette.neutralColorGray,
      disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
      minimumSize: Size(MediaQuery.sizeOf(context).width, 48),
      maximumSize: Size(MediaQuery.sizeOf(context).width, 48),
      textStyle: context.textTheme.titleSmall,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );

// styling for text button
ButtonStyle textButtonStyle(BuildContext context) => TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      disabledBackgroundColor: AppColorPalette.neutralColorGray,
      disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
      textStyle: context.textTheme.titleSmall,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );

// styling for date picker
DatePickerThemeData datePickerTheme(BuildContext context) =>
    DatePickerThemeData(
      backgroundColor: AppColorPalette.neutralColorWhite,
      weekdayStyle: const TextStyle(
        color: AppColorPalette.neutralColorBlack,
      ),
      dayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return context.colors.primary;
        },
      ),
      todayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return AppColorPalette.primaryColorSkyDark;
        },
      ),
      yearForegroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return context.colors.primary;
        },
      ),
      headerForegroundColor: AppColorPalette.neutralColorWhite,
      headerBackgroundColor: context.colors.primary,
      dividerColor: Colors.white,
      surfaceTintColor: Colors.white,
    );

// Styling for theme
ThemeData themeData({
  required BuildContext context,
  Color? colorSchemePrimary,
  Color? colorSchemeSecondary,
}) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: AppColorPalette.neutralColorWhite,
    textTheme: _textTheme,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: _textTheme.titleMedium,
      surfaceTintColor: AppColorPalette.neutralColorWhite,
      iconTheme: const IconThemeData(
        color: AppColorPalette.neutralColorBlack,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        // style: elevatedButtonStyle(context),
        style: ElevatedButton.styleFrom(
      backgroundColor:
          colorSchemePrimary ?? AppColorPalette.primaryColorSkyDark,
      foregroundColor: AppColorPalette.neutralColorWhite,
      disabledBackgroundColor: AppColorPalette.neutralColorGray,
      disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
      minimumSize: Size(MediaQuery.sizeOf(context).width, 48),
      maximumSize: Size(MediaQuery.sizeOf(context).width, 48),
      textStyle: context.textTheme.titleSmall,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        // style: outlinedButtonStyle(context),
        style: OutlinedButton.styleFrom(
      backgroundColor: AppColorPalette.neutralColorWhite,
      foregroundColor:
          colorSchemePrimary ?? AppColorPalette.primaryColorSkyDark,
      side: BorderSide(
        color: colorSchemePrimary ?? AppColorPalette.primaryColorSkyDark,
      ),
      disabledBackgroundColor: AppColorPalette.neutralColorGray,
      disabledForegroundColor: Theme.of(context).colorScheme.onPrimary,
      minimumSize: Size(MediaQuery.sizeOf(context).width, 48),
      maximumSize: Size(MediaQuery.sizeOf(context).width, 48),
      textStyle: context.textTheme.titleSmall,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    )),
    textButtonTheme: TextButtonThemeData(
      style: textButtonStyle(context),
    ),
    // datePickerTheme: datePickerTheme(context),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: colorSchemePrimary ?? AppColorPalette.primaryColorSkyDark,
      onPrimary: AppColorPalette.neutralColorWhite,
      secondary: colorSchemeSecondary ?? AppColorPalette.primaryColorSkyLighter,
      onSecondary: AppColorPalette.neutralColorWhite,
      error: AppColorPalette.accentColorRed,
      onError: AppColorPalette.accenrColorRedLighter,
      background: Colors.white,
      onBackground: Colors.white,
      surface: AppColorPalette.neutralColorWhite,
      onSurface: colorSchemePrimary ?? AppColorPalette.primaryColorSkyDark,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: AppColorPalette.neutralColorWhite,
      surfaceTintColor: AppColorPalette.neutralColorWhite,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor:
          colorSchemeSecondary ?? AppColorPalette.primaryColorSkyLighter,
      elevation: 1,
    ),
    radioTheme: RadioThemeData(
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: MaterialStateColor.resolveWith(
        (states) => colorSchemePrimary ?? AppColorPalette.primaryColorSkyDark,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
  );
}
