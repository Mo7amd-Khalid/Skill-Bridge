import 'package:flutter/material.dart';

/// SkillBridge color system.
///
/// Based on the design specification:
/// - Primary: #6366F1
/// - Secondary: #06B6D4
/// - Tertiary: #10B981
/// - Warning: #F59E0B
/// - Dark canvas: #0B0F19
/// - Light canvas: #F8FAFC
abstract final class AppColors {
  // Brand
  static const primary = Color(0xFF6366F1);
  static const primaryLight = Color(0xFF4F46E5);
  static const secondary = Color(0xFF06B6D4);
  static const tertiary = Color(0xFF10B981);
  static const warning = Color(0xFFF59E0B);

  // Semantic
  static const error = Color(0xFFEF4444);
  static const success = tertiary;
  static const info = secondary;

  // Common
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  // Dark mode
  static const darkCanvas = Color(0xFF0B0F19);
  static const darkSurface = Color(0xFF111827);
  static const darkSurfaceElevated = Color(0xFF1F2937);
  static const darkBorder = Color(0xFF1E293B);
  static const darkBorderStrong = Color(0xFF334155);

  static const darkTextPrimary = Color(0xFFF9FAFB);
  static const darkTextSecondary = Color(0xFFE2E8F0);
  static const darkTextMuted = Color(0xFF94A3B8);

  // Light mode
  static const lightCanvas = Color(0xFFF8FAFC);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurfaceElevated = Color(0xFFF1F5F9);
  static const lightBorder = Color(0xFFE2E8F0);

  static const lightTextPrimary = Color(0xFF0F172A);
  static const lightTextSecondary = Color(0xFF334155);
  static const lightTextMuted = Color(0xFF64748B);

  // Overlay helpers
  static const darkOverlay = Color(0x66000000);
  static const lightOverlay = Color(0x14000000);

  // Match / telemetry
  static Color emeraldTint([double opacity = 0.10]) =>
      tertiary.withValues(alpha: opacity);

  static Color cyanTint([double opacity = 0.10]) =>
      secondary.withValues(alpha: opacity);

  static Color primaryTint([double opacity = 0.10]) =>
      primary.withValues(alpha: opacity);
}
