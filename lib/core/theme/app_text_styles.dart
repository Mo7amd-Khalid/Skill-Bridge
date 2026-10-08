import 'package:flutter/material.dart';

/// SkillBridge typography.
///
/// Geist is used for technical headers, labels, metrics and navigation.
/// Inter is used for body copy and dense readable content.
///
/// Add both font families to pubspec.yaml if you bundle them locally.
abstract final class AppTextStyles {
  // Geist — Headlines
  static const text32w600 = TextStyle(
    fontFamily: 'Geist',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 40 / 32,
    letterSpacing: -0.64,
  );

  static const text26w600 = TextStyle(
    fontFamily: 'Geist',
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 34 / 26,
    letterSpacing: -0.52,
  );

  static const text22w600 = TextStyle(
    fontFamily: 'Geist',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 28 / 22,
    letterSpacing: -0.33,
  );

  static const text18w600 = TextStyle(
    fontFamily: 'Geist',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    letterSpacing: -0.18,
  );

  // Inter — Body
  static const text16w400 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: -0.08,
  );

  static const text14w400 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static const text12w400 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    letterSpacing: 0.12,
  );

  // Geist — Labels
  static const text13w500 = TextStyle(
    fontFamily: 'Geist',
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 16 / 13,
    letterSpacing: 0.13,
  );

  static const text11w600 = TextStyle(
    fontFamily: 'Geist',
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 14 / 11,
    letterSpacing: 0.44,
  );

  static const text10w600 = TextStyle(
    fontFamily: 'Geist',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 12 / 10,
    letterSpacing: 0.60,
  );

  /// Enables tabular figures for dynamic metrics such as percentages,
  /// milestone counts and currency values.
  static const tabularFigures = FontFeature.tabularFigures();

  static TextStyle metric(TextStyle style) {
    return style.copyWith(
      fontFeatures: const [tabularFigures],
    );
  }
}

