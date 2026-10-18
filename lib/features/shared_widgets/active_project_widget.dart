import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/keywords.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/padding.dart';

class ActiveProjectWidget extends StatelessWidget {
  const ActiveProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkSurfaceElevated,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            spacing: 8.w,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.tertiary,
                radius: 4.r,
              ),
              Expanded(
                child: Text(
                  "DevPulse Tracker",
                  style: AppTextStyles.text14w400.copyWith(color: AppColors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(
                        color: AppColors.darkBorderStrong
                    )
                ),
                child: Text(AppKeywords.owner, style: AppTextStyles.text11w600,),
              ),
              Text("4 ${AppKeywords.members}", style: AppTextStyles.text11w600.copyWith(color: AppColors.darkTextMuted),)
            ],
          ),
          Text("Sprint 3 Milestones", style: AppTextStyles.text10w600,),
          LinearProgressIndicator(
            value: 0.7,
            color: AppColors.primary,
            backgroundColor: AppColors.darkBorderStrong,
            minHeight: 6.h,
            borderRadius: BorderRadiusGeometry.circular(9999),
          ),
          Row(
            children: [
              Icon(Icons.watch_later_outlined, color: AppColors.darkTextMuted,),
              Text("${AppKeywords.nextStandup} Tomorrow 10:00 AM", style: AppTextStyles.text12w400.copyWith(color: AppColors.darkTextMuted),),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: AppColors.darkTextMuted,size: 15,)
            ],
          )

        ],
      ).allPadding(16),
    );
  }
}
