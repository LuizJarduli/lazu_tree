import 'package:flutter/material.dart';
import 'package:lazu_tree/app/shared/ui/theme/app_colors.dart';
import 'package:lazu_tree/app/shared/ui/theme/app_theme.dart';

/// Light theme configuration
class LightTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppTheme.fontFamily,
    textTheme: AppTheme.textTheme,

    // Color Scheme
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryVariant,
      onPrimaryContainer: Colors.black87,

      secondary: AppColors.lazuPurple,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.lazuPurpleLight,
      onSecondaryContainer: AppColors.lazuPurple,

      tertiary: AppColors.navBarSelected,
      onTertiary: Colors.white,
      tertiaryContainer: AppColors.navBarSelected.withValues(alpha: .2),
      onTertiaryContainer: AppColors.navBarSelected,
      onSurface: Colors.black87,
      surfaceContainerHighest: AppColors.backgroundLight,
      onSurfaceVariant: Colors.black54,

      error: AppColors.error,
      errorContainer: AppColors.error.withValues(alpha: 0.2),
      onErrorContainer: AppColors.error,

      outline: Colors.grey.shade300,
      outlineVariant: Colors.grey.shade200,
      shadow: AppColors.shadow,
      scrim: Colors.black26,
      inverseSurface: Colors.grey.shade900,
      onInverseSurface: Colors.white,
      inversePrimary: AppColors.primary,
      surfaceTint: AppColors.primary,
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTheme.textTheme.titleLarge?.copyWith(
        color: Colors.black87,
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: AppTheme.textTheme.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lazuPurple,
        textStyle: AppTheme.textTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
    ),

    // Icon Button Theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.lazuPurple,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: const CircleBorder(),
      ),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      shape: CircleBorder(),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.lazuPurple,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: const UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.lazuPurple, width: 2),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      labelStyle: AppTheme.textTheme.bodyMedium?.copyWith(
        color: Colors.grey.shade600,
      ),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade300,
      thickness: 1,
      space: 1,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lazuPurpleLight,
      selectedColor: AppColors.lazuPurple,
      disabledColor: Colors.grey.shade300,
      labelStyle: AppTheme.textTheme.bodyMedium,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.lazuPurple,
      linearTrackColor: Colors.grey,
    ),

    // SnackBar Theme
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lazuPurple,
      contentTextStyle: AppTheme.textTheme.bodyMedium?.copyWith(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
