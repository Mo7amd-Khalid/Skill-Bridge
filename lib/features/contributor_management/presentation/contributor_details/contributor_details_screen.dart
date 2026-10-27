import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/features/project_management/data/models/project_model.dart';
import 'package:skill_bridge/features/shared_widgets/logo_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/padding.dart';
import '../../../../core/utils/string_extension.dart';
import '../../../shared_widgets/status_widget.dart';
import '../../data/models/collaborator_model.dart';

class ContributorDetailsScreen extends StatefulWidget {
  const ContributorDetailsScreen({super.key, required this.contributor});

  final ContributorModel contributor;

  @override
  State<ContributorDetailsScreen> createState() => _ContributorDetailsScreenState();
}

class _ContributorDetailsScreenState extends State<ContributorDetailsScreen> {

  late List<ProjectModel> contributedProjects;

  @override
  void initState() {
    contributedProjects = dummyProjects.where((element) => widget.contributor.contributedProjectsIDs.contains(element.id)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: logoWidget(),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14.h,
          children: [
            Row(
              spacing: 10.w,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 32.r,
                  child: Text(widget.contributor.name.initials, style: AppTextStyles.text16w400.copyWith(
                    fontSize: 16.sp
                  ),),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.contributor.name, style: AppTextStyles.text18w600.copyWith(
                        fontSize: 18.sp,
                          color: AppColors.white
                      ),),
                      Text(
                        widget.contributor.title
                        , style: AppTextStyles.text11w600.copyWith(
                        fontSize: 11.sp,
                        color: AppColors.primary.withAlpha(175)
                      ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              widget.contributor.bio,
              style: AppTextStyles.text14w400.copyWith(
                color: AppColors.white,
                fontSize: 14.sp,
              ),
            ),
            Row(
              spacing: 10.w,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      border: Border.all(
                        color: AppColors.darkBorderStrong,
                      )
                    ),
                    child: Column(
                      spacing: 2.h,
                      children: [
                        Text(widget.contributor.skills.length.toString(), style: AppTextStyles.text18w600.copyWith(
                          fontSize: 18.sp
                        ),),
                        Text(AppKeywords.skills,style: AppTextStyles.text11w600.copyWith(fontSize: 11.sp),)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      border: Border.all(
                        color: AppColors.darkBorderStrong,
                      )
                    ),
                    child: Column(
                      spacing: 2.h,
                      children: [
                        Text(widget.contributor.contributedProjectsIDs.length.toString(), style: AppTextStyles.text18w600.copyWith(
                          fontSize: 18.sp
                        ),),
                        Text(AppKeywords.projects,style: AppTextStyles.text11w600.copyWith(fontSize: 11.sp),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(AppKeywords.skillsAndCompetencies, style: AppTextStyles.text13w500.copyWith(fontSize: 13.sp)),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: widget.contributor.skills.map((skill) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(
                      color: AppColors.darkBorderStrong,
                    ),
                  ),
                  child: Text(
                    skill,
                    style: AppTextStyles.text11w600,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            ),
            Text(AppKeywords.availabilityAndWorkingStyle, style: AppTextStyles.text13w500.copyWith(fontSize: 13.sp)),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  border: Border.all(
                    color: AppColors.darkBorderStrong,
                  )
              ),
              child: Column(
                spacing: 2.h,
                children: [
                  Text(widget.contributor.availableHours.toString(), style: AppTextStyles.text18w600.copyWith(
                      fontSize: 18.sp
                  ),),
                  Text(AppKeywords.hrsPerDay,style: AppTextStyles.text11w600.copyWith(fontSize: 11.sp),)
                ],
              ),
            ),
            Text(AppKeywords.activeAndCompletedProjects, style: AppTextStyles.text13w500.copyWith(fontSize: 13.sp)),
            ...contributedProjects.map((project) => Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: AppColors.darkSurfaceElevated,
                  border: Border.all(
                    color: AppColors.darkBorderStrong,
                  )
              ),
              child: Column(
                spacing: 10.h,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(project.title, style: AppTextStyles.text18w600.copyWith(
                                fontSize: 18.sp
                            ),overflow: TextOverflow.ellipsis,),
                            Text(project.description, style: AppTextStyles.text12w400.copyWith(
                                fontSize: 12.sp
                            ),),
                          ],
                        ),
                      ),
                      statusWidget(project.status),
                    ],
                  ),
                  Divider(
                    color: AppColors.darkBorderStrong,
                    thickness: 1.h,
                  ),
                  Row(
                    spacing: 5.w,
                    children: [
                      Row(
                        spacing: 5.w,
                        children: [
                          if(widget.contributor.id == project.projectManagerId)
                            Icon(Icons.privacy_tip_outlined, color: AppColors.secondary,size: 13.sp,),
                          Text(widget.contributor.id == project.projectManagerId? AppKeywords.owner : AppKeywords.contributor, style: AppTextStyles.text11w600.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.darkTextMuted
                          ),),
                        ],
                      ),

                      Row(
                        spacing: 5.w,
                        children: [
                          Icon(Icons.people_alt_outlined, color: AppColors.darkTextMuted,size: 13.sp,),
                          Text("${project.memberIds.length} ${AppKeywords.members}", style: AppTextStyles.text11w600.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.darkTextMuted
                          ),),
                        ],
                      ),

                      Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                          onPressed: (){
                          Navigator.pushNamed(context, Routes.projectDetailsScreen, arguments: project);
                          },
                          child: Row(
                        children: [
                          Text(AppKeywords.details),
                          Icon(Icons.arrow_forward_ios_outlined, size: 13.sp,)
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ))


          ],
        ),
      ),
      bottomNavigationBar: widget.contributor.managedProjectsIDs.isNotEmpty ? FilledButton(
        onPressed: (){},
        style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
            )
        ),
        child: Text(AppKeywords.inviteToProject),
      ).constPaddingForPage() : null,
    );
  }
}
