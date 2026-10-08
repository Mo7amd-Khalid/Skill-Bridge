import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class IndicatorForPages extends StatelessWidget {
  const IndicatorForPages({super.key, required this.length, required this.isSelectedIndex});
  final int length;
  final int isSelectedIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      children: List.generate(length, (index) {
        bool isSelected = isSelectedIndex == index;
        return Container(
        width: isSelected? 32.w : 8.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: isSelected? AppColors.primary : AppColors.darkBorder,
          borderRadius: BorderRadius.circular(1000),
        ),
      );
      }),
    );
  }
}
