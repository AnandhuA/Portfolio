import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    fontFamily: 'OpenSans',
    brightness: Brightness.light,
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.black),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.gray),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.black,
      onPrimary: AppColors.white,
      secondary: AppColors.mediumGray,
      onSecondary: AppColors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),
  );
}
