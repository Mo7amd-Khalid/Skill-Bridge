import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/core/utils/string_extension.dart';
import 'package:skill_bridge/features/contributor_management/data/models/collaborator_model.dart';

import '../../core/const/keywords.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/padding.dart';

class ContributorWidget extends StatelessWidget {
  const ContributorWidget({super.key, required this.contributor});

  final ContributorModel contributor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.contributorDetailsScreen, arguments: contributor);
      },
      child: SizedBox(
        width: 300.w,
        child: Card(
          color: AppColors.darkSurfaceElevated,
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10.w,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 22.r,
                    child: Text(contributor.name.initials, style: AppTextStyles.text11w600,),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contributor.name, style: AppTextStyles.text14w400.copyWith(color: AppColors.white),),
                        Text(
                          contributor.title
                          , style: AppTextStyles.text12w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: [
                  ...contributor.skills.take(3).map((skill) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999),
                        color: AppColors.darkBorderStrong,
                      ),
                      child: Text(
                        skill,
                        style: AppTextStyles.text11w600,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
                  if(contributor.skills.length > 3)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9999),
                        border: Border.all(
                          color: AppColors.darkBorderStrong,
                        ),
                      ),
                      child: Text(
                        '...',
                        style: AppTextStyles.text11w600,
                      ),
                    ),
                ],
              ),
              Row(
                spacing: 2,
                children: [
                  Icon(Icons.watch_later_outlined, color: AppColors.tertiary,),
                  Text("${AppKeywords.avail}: ${contributor.availableHours} hrs/day", style: AppTextStyles.text11w600.copyWith(color: AppColors.white)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                  onPressed: (){},
                  child: Row(
                    spacing: 5.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_add_alt_outlined, color: AppColors.secondary,),
                      Text("Invite to Project", style: AppTextStyles.text11w600.copyWith(
                        fontSize: 11.sp,
                        color: AppColors.white
                      ),)
                    ],
                  )),
            ],
          ).allPadding(16),
        ),
      ),
    );
  }
}
