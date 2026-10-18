import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/theme/app_text_styles.dart';
import 'package:skill_bridge/features/shared_widgets/custom_textFormField.dart';
import '../../../shared_widgets/active_project_widget.dart';
import '../../../shared_widgets/contributor_widget.dart';
import '../../../shared_widgets/project_card.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10.h,
        children: [
          Text("${AppKeywords.goodMorning} Mohamed ${AppKeywords.handEmotion}", style: AppTextStyles.text22w600,),
          CustomTextFormField(
            controller: searchController,
            hint: Text(
              AppKeywords.hintForSearch,
              style: AppTextStyles.text12w400.copyWith(color: AppColors.darkTextMuted),),
            prefix: Icon(Icons.search_outlined, color: AppColors.darkTextMuted,),
            keyboardType: TextInputType.text,
            onChanged: (value){
              // search functionality
            },
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    AppKeywords.projectsMatchingYourSkills,
                    style: AppTextStyles.text16w400.copyWith(color: AppColors.white),
                    overflow: TextOverflow.ellipsis,
                  )),
              TextButton(onPressed: (){} ,child: Text(AppKeywords.viewAll, style: AppTextStyles.text11w600,),)
            ],
          ),
          SizedBox(
            height: 430.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => ProjectCard(),
                separatorBuilder: (_, _) => 14.horizontalSpace,
                itemCount: 10),
          ),
          Row(
            children: [
              Expanded(child: Text(
                AppKeywords.peopleYouMayWantToWorkWith,
                style: AppTextStyles.text16w400.copyWith(color: AppColors.white),
                overflow: TextOverflow.ellipsis,
              )),
              TextButton(onPressed: (){} ,child: Text(AppKeywords.explore, style: AppTextStyles.text11w600,),)
            ],
          ),
          SizedBox(
            height: 240.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => ContributorWidget(),
              separatorBuilder: (_, _) => 14.horizontalSpace,
              itemCount: 10,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    AppKeywords.yourActiveProjects,
                    style: AppTextStyles.text16w400.copyWith(color: AppColors.white),
                    overflow: TextOverflow.ellipsis,
                  )),
              Text("1 ${AppKeywords.active}", style: AppTextStyles.text11w600.copyWith(color: AppColors.darkTextMuted),)
            ],
          ),
          SizedBox(
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => SizedBox(
                width: 300,
                child: ActiveProjectWidget(),
              ),
              separatorBuilder: (_, _) => 14.horizontalSpace,
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
