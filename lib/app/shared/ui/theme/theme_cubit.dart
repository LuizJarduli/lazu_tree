import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazu_tree/app/shared/ui/theme/dark_theme.dart';
import 'package:lazu_tree/app/shared/ui/theme/light_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  /// Initialize theme based on system preference
  void initializeTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isDark = brightness == Brightness.dark;

    emit(
      state.copyWith(
        themeMode: isDark ? AppThemeMode.dark : AppThemeMode.light,
        isSystemTheme: true,
      ),
    );
  }

  /// Toggle between light and dark themes
  void toggleTheme() {
    final newMode =
        state.themeMode == AppThemeMode.light
            ? AppThemeMode.dark
            : AppThemeMode.light;

    emit(
      state.copyWith(
        themeMode: newMode,
        isSystemTheme: false,
      ),
    );
  }

  /// Set theme to follow system preference
  void setSystemTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isDark = brightness == Brightness.dark;

    emit(
      state.copyWith(
        themeMode: isDark ? AppThemeMode.dark : AppThemeMode.light,
        isSystemTheme: true,
      ),
    );
  }

  /// Set theme to light mode
  void setLightTheme() {
    emit(
      state.copyWith(
        themeMode: AppThemeMode.light,
        isSystemTheme: false,
      ),
    );
  }

  /// Set theme to dark mode
  void setDarkTheme() {
    emit(
      state.copyWith(
        themeMode: AppThemeMode.dark,
        isSystemTheme: false,
      ),
    );
  }

  /// Get the current theme data
  ThemeData get currentTheme {
    switch (state.themeMode) {
      case AppThemeMode.light:
        return LightTheme.theme;
      case AppThemeMode.dark:
        return DarkTheme.theme;
      case AppThemeMode.system:
        final brightness =
            WidgetsBinding.instance.platformDispatcher.platformBrightness;
        return brightness == Brightness.dark
            ? DarkTheme.theme
            : LightTheme.theme;
    }
  }

  /// Get the current theme mode for MaterialApp
  ThemeMode get themeMode {
    switch (state.themeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}
