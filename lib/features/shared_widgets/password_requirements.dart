import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

Widget passwordRequirements({
  required bool hasUppercase,
  required bool hasLowercase,
  required bool hasDigit,
  required bool hasSpecialCharacter,
  required bool hasMinLength,
}){
  return Column(
    children: [
      _buildRule(
        'Has uppercase letter',
        hasUppercase,
      ),
      _buildRule(
        'Has lowercase letter',
        hasLowercase,
      ),
      _buildRule(
        'Has digit',
        hasDigit,
      ),
      _buildRule(
        'Has special character',
        hasSpecialCharacter,
      ),
      _buildRule(
        'Max of 8 characters',
        hasMinLength,
      ),
    ],
  );
}

Widget _buildRule(String label, bool isValid) {
  final color = isValid ? AppColors.success : AppColors.error;
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      children: [
        Icon(isValid ? Icons.check : Icons.close, color: color, size: 22),
        const SizedBox(width: 10),
        Text(label, style: TextStyle(color: color, fontSize: 14)),
      ],
    ),
  );
}
