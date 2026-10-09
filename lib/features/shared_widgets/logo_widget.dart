import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/assets.dart';
import '../../core/const/keywords.dart';
import '../../core/theme/app_text_styles.dart';

Widget logoWidget() => Row(
  spacing: 8.w,
  children: [
    Image.asset(AppImages.logo, width: 32.w, height: 32.h),
    Text(AppKeywords.appName,style: AppTextStyles.text18w600.copyWith(fontSize: 18.sp),),
  ],
);
