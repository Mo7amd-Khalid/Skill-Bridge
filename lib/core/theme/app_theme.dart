import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light => _buildTheme(Brightness.light);
  static ThemeData get dark => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: isDark ? AppColors.primary : AppColors.primaryLight,
      onPrimary: AppColors.white,
      primaryContainer: isDark
          ? const Color(0xFF3730A3)
          : const Color(0xFFE0E7FF),
      onPrimaryContainer: isDark
          ? AppColors.white
          : const Color(0xFF312E81),

      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      secondaryContainer: isDark
          ? const Color(0xFF164E63)
          : const Color(0xFFCFFAFE),
      onSecondaryContainer: isDark
          ? AppColors.white
          : const Color(0xFF164E63),

      tertiary: AppColors.tertiary,
      onTertiary: AppColors.white,
      tertiaryContainer: isDark
          ? const Color(0xFF065F46)
          : const Color(0xFFD1FAE5),
      onTertiaryContainer: isDark
          ? AppColors.white
          : const Color(0xFF064E3B),

      error: AppColors.error,
      onError: AppColors.white,
      errorContainer: isDark
          ? const Color(0xFF7F1D1D)
          : const Color(0xFFFEE2E2),
      onErrorContainer: isDark
          ? AppColors.white
          : const Color(0xFF7F1D1D),

      surface: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      onSurface:
          isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
      surfaceContainerLowest:
          isDark ? AppColors.darkCanvas : AppColors.lightCanvas,
      surfaceContainerLow:
          isDark ? AppColors.darkSurface : AppColors.lightSurface,
      surfaceContainer:
          isDark ? AppColors.darkSurfaceElevated : AppColors.lightSurfaceElevated,
      surfaceContainerHigh:
          isDark ? AppColors.darkSurfaceElevated : AppColors.lightSurfaceElevated,
      surfaceContainerHighest:
          isDark ? AppColors.darkBorderStrong : AppColors.lightBorder,
      onSurfaceVariant:
          isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
      outline: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
      outlineVariant: isDark ? AppColors.darkBorder : AppColors.lightBorder,
      inverseSurface:
          isDark ? AppColors.lightSurface : AppColors.darkSurface,
      onInverseSurface:
          isDark ? AppColors.lightTextPrimary : AppColors.darkTextPrimary,
      inversePrimary: isDark ? AppColors.primaryLight : AppColors.primary,
      shadow: AppColors.black,
      scrim: AppColors.black,
    );

    final baseTextTheme = _textTheme(brightness);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          isDark ? AppColors.darkCanvas : AppColors.lightCanvas,
      canvasColor: isDark ? AppColors.darkCanvas : AppColors.lightCanvas,

      fontFamily: 'Inter',
      textTheme: baseTextTheme,

      appBarTheme: AppBarTheme(
        backgroundColor:
            isDark ? AppColors.darkCanvas : AppColors.lightCanvas,
        foregroundColor:
            isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.headlineSm.copyWith(
          color: isDark
              ? AppColors.darkTextPrimary
              : AppColors.lightTextPrimary,
        ),
      ),

      cardTheme: CardThemeData(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? const Color(0xFF0F172A) : AppColors.lightSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: _inputBorder(
          isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        enabledBorder: _inputBorder(
          isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
        focusedBorder: _inputBorder(colorScheme.primary),
        errorBorder: _inputBorder(AppColors.error),
        focusedErrorBorder: _inputBorder(AppColors.error),
        hintStyle: AppTextStyles.bodyMd.copyWith(
          color: isDark
              ? AppColors.darkTextMuted
              : AppColors.lightTextMuted,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 44),
          backgroundColor: colorScheme.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTextStyles.labelLg,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 44),
          foregroundColor:
              isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          side: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTextStyles.labelLg,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: AppTextStyles.labelLg,
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor:
            isDark ? AppColors.darkBorder : AppColors.lightSurfaceElevated,
        selectedColor: colorScheme.primary.withValues(alpha: 0.15),
        disabledColor:
            isDark ? AppColors.darkSurfaceElevated : AppColors.lightSurfaceElevated,
        side: BorderSide(
          color: isDark ? AppColors.darkBorderStrong : AppColors.lightBorder,
        ),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        labelStyle: AppTextStyles.labelMd.copyWith(
          color: isDark
              ? AppColors.darkTextSecondary
              : AppColors.lightTextSecondary,
        ),
      ),

      dividerTheme: DividerThemeData(
        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        thickness: 1,
        space: 1,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDark ? AppColors.darkCanvas.withValues(alpha: 0.85) : AppColors.white,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor:
            isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: AppColors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor:
            isDark ? AppColors.darkSurfaceElevated : AppColors.lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isDark ? AppColors.darkBorderStrong : AppColors.lightBorder,
          ),
        ),
        titleTextStyle: AppTextStyles.headlineSm.copyWith(
          color: isDark
              ? AppColors.darkTextPrimary
              : AppColors.lightTextPrimary,
        ),
        contentTextStyle: AppTextStyles.bodyMd.copyWith(
          color: isDark
              ? AppColors.darkTextSecondary
              : AppColors.lightTextSecondary,
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            isDark ? AppColors.darkSurfaceElevated : AppColors.lightTextPrimary,
        contentTextStyle: AppTextStyles.bodyMd.copyWith(
          color: AppColors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static TextTheme _textTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final primary = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final secondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return TextTheme(
      displayLarge: AppTextStyles.headlineLg.copyWith(color: primary),
      displayMedium: AppTextStyles.headlineLgMobile.copyWith(color: primary),
      headlineLarge: AppTextStyles.headlineLg.copyWith(color: primary),
      headlineMedium: AppTextStyles.headlineMd.copyWith(color: primary),
      headlineSmall: AppTextStyles.headlineSm.copyWith(color: primary),
      bodyLarge: AppTextStyles.bodyLg.copyWith(color: secondary),
      bodyMedium: AppTextStyles.bodyMd.copyWith(color: secondary),
      bodySmall: AppTextStyles.bodySm.copyWith(
        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
      ),
      labelLarge: AppTextStyles.labelLg.copyWith(color: primary),
      labelMedium: AppTextStyles.labelMd.copyWith(color: secondary),
      labelSmall: AppTextStyles.labelSm.copyWith(color: secondary),
    );
  }

  static OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }
}
