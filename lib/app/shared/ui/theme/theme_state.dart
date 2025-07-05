part of 'theme_cubit.dart';

enum AppThemeMode {
  light,
  dark,
  system;

  ThemeMode get idiomaticThemeMode {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}

class ThemeState extends Equatable {
  const ThemeState({
    this.themeMode = AppThemeMode.system,
    this.isSystemTheme = true,
  });

  final AppThemeMode themeMode;

  final bool isSystemTheme;

  @override
  List<Object?> get props => [themeMode, isSystemTheme];

  ThemeState copyWith({
    AppThemeMode? themeMode,
    bool? isSystemTheme,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isSystemTheme: isSystemTheme ?? this.isSystemTheme,
    );
  }
}
