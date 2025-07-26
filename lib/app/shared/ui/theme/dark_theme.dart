import 'package:flutter/material.dart';
import 'package:lazu_tree/app/shared/ui/theme/app_colors.dart';
import 'package:lazu_tree/app/shared/ui/theme/app_theme.dart';

/// Dark theme configuration
class DarkTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppTheme.fontFamily,
    textTheme: AppTheme.textTheme,

    // Color Scheme
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: Colors.black87,
      primaryContainer: AppColors.primaryVariant,
      onPrimaryContainer: Colors.white,

      secondary: AppColors.lazuPurple,
      onSecondary: Colors.black87,
      secondaryContainer: AppColors.lazuPurpleLight,
      onSecondaryContainer: Colors.white,

      tertiary: AppColors.navBarSelected,
      onTertiary: Colors.black87,
      tertiaryContainer: AppColors.navBarSelected.withValues(alpha: .3),
      onTertiaryContainer: Colors.white,

      surface: const Color(0xFF1E1E1E),
      surfaceContainerHighest: const Color(0xFF2D2D2D),
      onSurfaceVariant: Colors.white70,

      error: AppColors.error,
      onError: Colors.black87,
      errorContainer: AppColors.error.withValues(alpha: .3),
      onErrorContainer: Colors.white,

      outline: Colors.grey.shade600,
      outlineVariant: Colors.grey.shade700,
      shadow: AppColors.shadow,
      scrim: Colors.black54,
      inverseSurface: Colors.white,
      onInverseSurface: Colors.black87,
      inversePrimary: AppColors.primary,
      surfaceTint: AppColors.primary,
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTheme.textTheme.titleLarge?.copyWith(
        color: Colors.white,
      ),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: const Color(0xFF2D2D2D),
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
        foregroundColor: Colors.black87,
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
      foregroundColor: Colors.black87,
      elevation: 4,
      shape: CircleBorder(),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: AppColors.lazuPurple,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2D2D2D),
      border: const UnderlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600),
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
        color: Colors.grey.shade400,
      ),
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: Colors.grey.shade700,
      thickness: 1,
      space: 1,
    ),

    // Chip Theme
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lazuPurpleLight,
      selectedColor: AppColors.lazuPurple,
      disabledColor: Colors.grey.shade700,
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
