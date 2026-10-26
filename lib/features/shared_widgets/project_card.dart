import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/core/utils/time_and_date.dart';
import 'package:skill_bridge/features/project_management/data/models/project_model.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/padding.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: Card(
        color: AppColors.darkSurfaceElevated,
        child: Column(
          spacing: 4.h,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  spacing: 5.w,
                  children: [
                    Text(project.createdAt.timeAgo, style: AppTextStyles.text12w400),
                  ],
                ),
                Spacer(),
                // calculate the percentage of my skills and project skills and show it
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
            // project manager Info
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

            // title
            Text(
              project.title,
              style: AppTextStyles.text18w600,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // description
            Text(
              project.description,
              style: AppTextStyles.text12w400,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Text(AppKeywords.needs, style: AppTextStyles.text11w600,),
            // required skills
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
                child: Text(project.requiredSkills[index].skillName, style: AppTextStyles.text11w600,),
              ),
              itemCount: project.requiredSkills.length,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 2,
              children: [
                Row(
                  children: [
                    Icon(Icons.people_alt_outlined, color: AppColors.darkTextMuted,),
                    Text("${project.memberIds.length} ${AppKeywords.members}", style: AppTextStyles.text11w600.copyWith(color: AppColors.darkTextMuted)),
                  ],
                ),

                FilledButton(
                    onPressed: (){
                      Navigator.pushNamed(context, Routes.projectDetailsScreen, arguments: project);
                    },
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
      ),
    );
  }
}
