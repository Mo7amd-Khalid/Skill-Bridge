import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.keyboardType,
    this.isObscured,
    this.prefix,
    this.suffix,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.hint,
    this.validator,
    this.onChanged
  });

  final TextEditingController controller;
  final String title;
  final Widget? hint;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final bool? isObscured;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.text13w500),
        TextFormField(
          onChanged: onChanged,
          obscureText: isObscured ?? false,
          controller: controller,
          validator: validator,
          cursorColor: AppColors.darkTextMuted,
          decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.darkTextMuted),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.darkTextMuted),
            ),

            hint: hint,
            hintStyle: AppTextStyles.text14w400.copyWith(
              color: AppColors.darkTextMuted,
            ),
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
