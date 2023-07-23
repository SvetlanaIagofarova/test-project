import 'package:flutter/material.dart';
import 'package:test_project/ui/theme/app_colors.dart';

class MainTheme {
  ThemeData mainTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: AppColors.mainPurple),
    ),
    unselectedWidgetColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.mainPurple,
    ),
    scaffoldBackgroundColor: AppColors.mainLightPink,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.mainPurple,
      selectionColor: AppColors.mainPurple,
      selectionHandleColor: AppColors.mainPurple,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.mainLightPurple,
        fontWeight: FontWeight.w300,
      ),
      isDense: true,
      contentPadding: EdgeInsets.all(10),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.mainPurple,
        ),
      ),
    ),
  );
}
