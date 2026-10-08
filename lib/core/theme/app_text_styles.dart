import 'package:flutter/material.dart';

/// SkillBridge typography.
///
/// Geist is used for technical headers, labels, metrics and navigation.
/// Inter is used for body copy and dense readable content.
///
/// Add both font families to pubspec.yaml if you bundle them locally.
abstract final class AppTextStyles {
  // Headlines — Geist
  static const headlineLg = TextStyle(
    fontFamily: 'Geist',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 40 / 32,
    letterSpacing: -0.64, // -0.02em
  );

  static const headlineLgMobile = TextStyle(
    fontFamily: 'Geist',
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 34 / 26,
    letterSpacing: -0.52, // -0.02em
  );

  static const headlineMd = TextStyle(
    fontFamily: 'Geist',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 28 / 22,
    letterSpacing: -0.33, // -0.015em
  );

  static const headlineSm = TextStyle(
    fontFamily: 'Geist',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    letterSpacing: -0.18, // -0.01em
  );

  // Body — Inter
  static const bodyLg = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: -0.08, // -0.005em
  );

  static const bodyMd = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static const bodySm = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    letterSpacing: 0.12, // 0.01em
  );

  // Labels — Geist
  static const labelLg = TextStyle(
    fontFamily: 'Geist',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 16 / 13,
    letterSpacing: 0.13, // 0.01em
  );

  static const labelMd = TextStyle(
    fontFamily: 'Geist',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
    letterSpacing: 0.44, // 0.04em
  );

  static const labelSm = TextStyle(
    fontFamily: 'Geist',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 12 / 10,
    letterSpacing: 0.60, // 0.06em
  );

  /// Enables tabular figures for dynamic metrics such as percentages,
  /// milestone counts and currency values.
  static const tabularFigures = FontFeature.tabularFigures();

  static TextStyle metric(TextStyle style) {
    return style.copyWith(fontFeatures: const [tabularFigures]);
  }
}
