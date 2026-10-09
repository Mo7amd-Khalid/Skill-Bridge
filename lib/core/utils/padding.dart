import 'package:flutter/material.dart';

extension PaddingApp on Widget{
  Widget allPadding(double num) {
    return Padding(
      padding: EdgeInsets.all(num),
      child: this,
    );

  }

  Widget constPaddingForPage() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: this,
    );

  }

  Widget horizontalPadding(double num) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: num),
      child: this,
    );

  }

  Widget verticalPadding(double num) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: num),
      child: this,
    );

  }
}