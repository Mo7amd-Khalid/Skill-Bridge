import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/const/keywords.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/padding.dart';

class ContributorWidget extends StatelessWidget {
  const ContributorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.darkSurfaceElevated,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 10.w,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 22.r,
                child: Text("MK", style: AppTextStyles.text11w600,),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mohamed Khaled", style: AppTextStyles.text14w400.copyWith(color: AppColors.white),),
                    Text(
                      "Senior UI/UX & Design Systems"
                      , style: AppTextStyles.text12w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 4.5,
              ),

              itemBuilder: (_, index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(
                        color: AppColors.darkBorderStrong
                    )
                ),
                child: Text(
                  "Flutter",
                  style: AppTextStyles.text11w600,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              itemCount: 6,
            ),
          ),
          Row(
            spacing: 2,
            children: [
              Icon(Icons.watch_later_outlined, color: AppColors.tertiary,),
              Text("${AppKeywords.avail}: 5-10 hrs/wk", style: AppTextStyles.text11w600.copyWith(color: AppColors.white)),
            ],
          )
        ],
      ).allPadding(16),
    );
  }
}
