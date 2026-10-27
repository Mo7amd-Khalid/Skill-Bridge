import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../project_management/data/models/project_model.dart';

Widget statusWidget(ProjectStatus status){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9999),
      color: status == ProjectStatus.open ? AppColors.success.withAlpha(40) : AppColors.darkSurfaceElevated,
      border: Border.all(
          color: status == ProjectStatus.open ? AppColors.success : AppColors.darkTextMuted
      ),
    ),
    child: Text(
      status.name,
      style: AppTextStyles.text11w600.copyWith(
        fontSize: 11.sp,
          color: status == ProjectStatus.open? AppColors.tertiary : AppColors.darkTextMuted
      ),),
  );
}