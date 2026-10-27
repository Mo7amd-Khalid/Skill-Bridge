import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/theme/app_text_styles.dart';
import 'package:skill_bridge/core/utils/time_and_date.dart';
import 'package:skill_bridge/features/contributor_management/data/models/collaborator_model.dart';
import 'package:skill_bridge/features/project_management/data/models/project_model.dart';

import '../../../../core/utils/padding.dart';
import '../../../shared_widgets/logo_widget.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key, required this.project});

  final ProjectModel project;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {

  late ContributorModel projectManager;
  late List<ContributorModel> collaborators;
  late int numOfRequiredCollaborators = 0;

  @override
  void initState() {
    projectManager = dummyUsers.firstWhere((element) => element.id == widget.project.projectManagerId);
    collaborators = dummyUsers.where((element) => widget.project.memberIds.contains(element.id)).toList();
    widget.project.requiredSkills.forEach((element){
      numOfRequiredCollaborators += element.requiredMembersCount;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: logoWidget(),
        titleSpacing: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border_outlined,)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
          child: Column(
            spacing: 12.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.project.title, style: AppTextStyles.text26w600.copyWith(fontSize: 26.sp),),
              Row(
                spacing: 4.w,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.watch_later_outlined,size: 10,),
                  Text(
                    "${AppKeywords.posted} ${widget.project.createdAt.timeAgo}",
                    style: AppTextStyles.text10w600.copyWith(fontSize: 10.sp),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: AppColors.darkSurfaceElevated,
                ),
                child: Row(
                  spacing: 12.w,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      child: Text(projectManager.name.substring(0,2)),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            spacing: 4.w,
                            children: [
                              Text(projectManager.name, style: AppTextStyles.text13w500.copyWith(fontSize: 13.sp),),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999),
                                  color: AppColors.primary.withAlpha(40),
                                ),
                                child: Text(AppKeywords.creator, style: AppTextStyles.text11w600.copyWith(fontSize: 11.sp,color: AppColors.primary),),
                              ),
                            ],
                          ),
                          Text(projectManager.bio,style: AppTextStyles.text12w400.copyWith(
                            fontSize: 12.sp
                          ), overflow: TextOverflow.ellipsis,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // matching with user skills
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: AppColors.darkSurfaceElevated,
                  border: Border.all(
                    color: AppColors.success
                  )
                ),
                child: Row(
                  spacing: 12.w,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 12.h,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9999),
                              color: AppColors.success.withAlpha(40),
                              border: Border.all(
                                  color: AppColors.success
                              ),
                            ),
                            child: Text("94% Match with your profile", style: AppTextStyles.text11w600.copyWith(fontSize: 11.sp,color: AppColors.tertiary),),
                          ),
                          Text(
                            "You match 3 of 3 required skills: Flutter, UI/UX, Mobile Apps",
                            style: AppTextStyles.text12w400.copyWith(
                              fontSize: 12.sp
                            ))
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.success.withAlpha(60),
                        child: Icon(Icons.check_circle_outline, color: AppColors.success,))
                  ],
                ),
              ),
              // project description
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: AppColors.darkSurfaceElevated,

                ),
                child: Column(
                  spacing: 5.h,
                  children: [
                    Row(
                      spacing: 4.w,
                      children: [
                        Icon(Icons.info_outline, color: AppColors.primary.withAlpha(180),),
                        Text(AppKeywords.aboutTheProject, style: AppTextStyles.text18w600.copyWith(
                          fontSize: 18.sp,
                          color: AppColors.darkTextSecondary
                        ),)
                      ],
                    ),
                    Text(widget.project.description,style: AppTextStyles.text14w400.copyWith(
                      fontSize: 14.sp
                    ),)
                  ],
                ),
              ),
              // existing skills
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: AppColors.darkSurfaceElevated,

                ),
                child: Column(
                  spacing: 5.h,
                  children: [
                    Row(
                      spacing: 4.w,
                      children: [
                        Icon(Icons.save_outlined, color: AppColors.secondary.withAlpha(180),),
                        Text(AppKeywords.whatWeAlreadyHave, style: AppTextStyles.text18w600.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.darkTextSecondary
                        ),)
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 5,
                          mainAxisExtent: 25.h
                      ),
                      itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9999),
                          color: AppColors.darkBorderStrong,
                        ),
                        child: Row(
                          spacing: 2.w,
                          children:[
                            Icon(Icons.check, color: AppColors.success,size: 15.sp,),
                            Text(
                            widget.project.existingSkills[index],
                            style: AppTextStyles.text11w600.copyWith(fontSize: 11.sp),)
                          ],
                        ),
                      ),
                      itemCount: widget.project.existingSkills.length,
                    )
                  ],
                ),
              ),
              // required skills
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: AppColors.darkSurfaceElevated,

                ),
                child: Column(
                  spacing: 5.h,
                  children: [
                    Row(
                      spacing: 4.w,
                      children: [
                        Icon(Icons.person_add_alt_outlined, color: AppColors.primary.withAlpha(180),),
                        Text(AppKeywords.skillsWeNeed, style: AppTextStyles.text18w600.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.darkTextSecondary
                        ),),
                        Spacer(),
                        Text(
                          "$numOfRequiredCollaborators ${AppKeywords.collaboratorsNeeded}",
                        style: AppTextStyles.text10w600.copyWith(fontSize: 10.sp, color: AppColors.primary),
                        ),

                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 5,
                          mainAxisExtent: 25.h
                      ),
                      itemBuilder: (_, index) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9999),
                          color: AppColors.darkBorderStrong,
                        ),
                        child: Text("Need ${widget.project.requiredSkills[index].requiredMembersCount} for ${widget.project.requiredSkills[index].skillName}",
                          style: AppTextStyles.text13w500.copyWith(fontSize: 13.sp),
                        ),
                      ),
                      itemCount: widget.project.requiredSkills.length,
                    )
                  ],
                ),
              ),
              //members
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  color: AppColors.darkSurfaceElevated,

                ),
                child: Column(
                  spacing: 5.h,
                  children: [
                    Row(
                      spacing: 4.w,
                      children: [
                        Icon(Icons.people_alt_outlined, color: AppColors.secondary.withAlpha(180),),
                        Text(AppKeywords.currentMembers, style: AppTextStyles.text18w600.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.darkTextSecondary
                        ),),
                      ],
                    ),
                    Column(
                      children: collaborators.map((member) => Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(12),
                          color: AppColors.darkBorderStrong.withAlpha(140),
                        ),
                        child: Row(
                          spacing: 12.w,
                          children: [
                            CircleAvatar(
                              radius: 22.r,
                              child: Text(member.name.substring(0,2)),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    spacing: 4.w,
                                    children: [
                                      Text(member.name, style: AppTextStyles.text13w500.copyWith(fontSize: 13.sp),),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9999),
                                          color: AppColors.darkBorderStrong,
                                        ),
                                        child: Text("Member", style: AppTextStyles.text11w600.copyWith(fontSize: 11.sp,color: AppColors.darkTextSecondary),),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    member.title,
                                    style: AppTextStyles.text11w600.copyWith(
                                      fontSize: 11.sp,
                                      color: AppColors.darkTextMuted
                                    ), overflow: TextOverflow.ellipsis,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ).verticalPadding(8)).toList(),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
      bottomNavigationBar: Row(
        spacing: 15.w,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.darkSurfaceElevated,
              borderRadius: BorderRadius.circular(10)
            ),
              child: Icon(Icons.bookmark_border_outlined,)),
          Expanded(
              child: FilledButton(
                  onPressed: (){},
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12)
                  )
                ),
                  child: Text(AppKeywords.requestToCollaborate),
              ))
        ],
      ).constPaddingForPage(),
    );
  }
}
