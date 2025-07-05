import 'package:flutter/material.dart';
import 'package:lazu_tree/app/shared/ui/theme/app_colors.dart';

/// Base theme configuration with custom font settings
class AppTheme {
  static const String _fontFamily = 'Montserrat';
  static const double _fontSize = 16;

  /// Base text theme with Montserrat font and 16px default size
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: _fontSize,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
  );

  /// Default font family for the app
  static const String fontFamily = _fontFamily;

  /// Default font size for the app
  static const double fontSize = _fontSize;
}

/// Extension to add custom colors to ColorScheme
extension AppColorScheme on ColorScheme {
  /// Custom card color
  Color get cardColor => AppColors.card;

  /// Custom card text color
  Color get cardTextColor => AppColors.cardText;

  /// Custom background light color
  Color get backgroundLight => AppColors.backgroundLight;

  /// Custom shadow color
  Color get shadowColor => AppColors.shadow;

  /// Lazú purple color
  Color get lazuPurple => AppColors.lazuPurple;

  /// Lazú purple light color
  Color get lazuPurpleLight => AppColors.lazuPurpleLight;

  /// NavBar selected color
  Color get navBarSelected => AppColors.navBarSelected;

  /// NavBar default color
  Color get navBarDefault => AppColors.navBarDefault;
}
