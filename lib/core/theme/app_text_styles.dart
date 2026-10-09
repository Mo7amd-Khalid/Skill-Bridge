import 'package:flutter/material.dart';

/// SkillBridge typography.
///
/// Geist is used for technical headers, labels, metrics and navigation.
/// Inter is used for body copy and dense readable content.
///
/// Add both font families to pubspec.yaml if you bundle them locally.

abstract final class AppTextStyles {
  // Geist
  static TextStyle get text32w600 => TextStyle(
    fontFamily: 'Geist',
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text26w600 => TextStyle(
    fontFamily: 'Geist',
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text22w600 => TextStyle(
    fontFamily: 'Geist',
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text18w600 => TextStyle(
    fontFamily: 'Geist',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // Inter
  static TextStyle get text16w400 => TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text14w400 => TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get text12w400 => TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  // Geist
  static TextStyle get text13w500 => TextStyle(
    fontFamily: 'Geist',
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get text11w600 => TextStyle(
    fontFamily: 'Geist',
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get text10w600 => TextStyle(
    fontFamily: 'Geist',
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
}

