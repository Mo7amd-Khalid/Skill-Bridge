import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/keywords.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/padding.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkSurfaceElevated,
      child: Column(
        spacing: 4.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Row(
                spacing: 5.w,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.darkBorderStrong,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Health & Wellness", style: AppTextStyles.text11w600,),
                  ),
                  Text("5h ago", style: AppTextStyles.text12w400),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999),
                  color: AppColors.success.withAlpha(40),
                  border: Border.all(
                      color: AppColors.success
                  ),
                ),
                child: Text("92% Match", style: AppTextStyles.text11w600.copyWith(color: AppColors.tertiary),),
              )
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 15.r,
                child: Text("MK", style: AppTextStyles.text11w600,),
              ),
              Expanded(child: Text(
                "Mohamed Khaled",
                style: AppTextStyles.text11w600,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ))
            ],
          ),
          Text(
            "AI Expense Tracker",
            style: AppTextStyles.text18w600,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Automated receipt parsing and budgeting for college students with zero manual entry.",
            style: AppTextStyles.text12w400,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Text(AppKeywords.needs, style: AppTextStyles.text11w600,),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 4.5
            ),
            itemBuilder: (_, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999),
                color: AppColors.darkBorderStrong,
              ),
              child: Text("92% Match", style: AppTextStyles.text11w600,),
            ),
            itemCount: 7,
          ),
          Row(
            spacing: 2,
            children: [
              Icon(Icons.people_alt_outlined, color: AppColors.darkTextMuted,),
              Text("3 ${AppKeywords.members}", style: AppTextStyles.text11w600.copyWith(color: AppColors.darkTextMuted)),
              Spacer(),
              FilledButton(
                  onPressed: (){},
                  style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8)
                      )
                  ),
                  child: Text(AppKeywords.viewProject)
              )
            ],
          )
        ],
      ).allPadding(16),
    );
  }
}
