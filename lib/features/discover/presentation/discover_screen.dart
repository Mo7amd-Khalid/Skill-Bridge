import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/skills_list.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/core/utils/padding.dart';
import 'package:skill_bridge/core/utils/resources.dart';
import 'package:skill_bridge/features/contributor_management/data/models/collaborator_model.dart';
import 'package:skill_bridge/features/discover/presentation/cubit/cubit.dart';
import 'package:skill_bridge/features/project_management/data/models/project_model.dart';
import 'package:skill_bridge/features/shared_widgets/contributor_widget.dart';
import 'package:skill_bridge/features/shared_widgets/custom_textFormField.dart';
import 'package:skill_bridge/features/shared_widgets/project_card.dart';

import '../../../core/const/keywords.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'cubit/contract.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController searchController = TextEditingController();
  final DiscoverCubit discoverCubit = getIt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppKeywords.discover),
      ),
      body: BlocProvider.value(
        value: discoverCubit,
        child: BlocBuilder<DiscoverCubit, DiscoverStates>(
          builder:(_, state) => Column(
            spacing: 10.h,
            children: [
              DefaultTabController(
                initialIndex: state.tab,
                length: 2,
                child: TabBar(
                  onTap: (index){
                    discoverCubit.doAction(ChangeTab(index: index));
                    discoverCubit.doAction(Search(text: searchController.text));
                  },
                    tabs: [
                  Tab(
                    icon: Icon(Icons.list),
                    text: AppKeywords.projects,
                    height: 65.h,
                  ),
                  Tab(
                    icon: Icon(Icons.people),
                    text: AppKeywords.contributors,
                    height: 65.h,
                  )
                ]
                ),
              ),
              CustomTextFormField(
                controller: searchController,
                hint: Text(
                  state.tab == 0 ? AppKeywords.hintForProjectSearch : AppKeywords.hintForContributorsSearch,
                  style: AppTextStyles.text12w400.copyWith(color: AppColors.darkTextMuted),),
                prefix: Icon(Icons.search_outlined, color: AppColors.darkTextMuted,),
                keyboardType: TextInputType.text,
                suffix: IconButton(onPressed: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => BlocProvider.value(
                    value: discoverCubit,
                    child: BlocBuilder<DiscoverCubit, DiscoverStates>(
                      builder:( context, bottomSheetState) => Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10.h,
                        children: [
                          Row(
                            spacing: 10.w,
                            children: [
                              Icon(Icons.tune_outlined),
                              Text(AppKeywords.filters),
                              Spacer(),
                              TextButton(onPressed: (){
                                discoverCubit.doAction(ClearSkillsFilters());
                              }, child: Text(AppKeywords.resetAll))
                            ],
                          ),
                          Text(AppKeywords.skills),
                          Wrap(
                            spacing: 10.w,
                            runSpacing: 10.h,
                            children: skillsList.map((skill) => InkWell(
                              onTap: (){
                                discoverCubit.doAction(AddOrRemoveElementsToSkillsFilter(skill: skill));
                                discoverCubit.doAction(Search(text: searchController.text));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9999),
                                  color: ((bottomSheetState.skillsFilters ?? [])).contains(skill) ? AppColors.success : AppColors.darkBorderStrong,
                                ),
                                child: Text(skill, style: AppTextStyles.text11w600,),
                              ),
                            )).toList(),
                          ),
                        ],
                      ).constPaddingForPage(),
                    ),
                  ));
                }, icon: Icon(Icons.tune_outlined, color: AppColors.darkTextMuted,)),
                onChanged: (value){
                  discoverCubit.doAction(Search(text: value));
                },
              ),
              Expanded(
                child: state.searchList!.data == null ?
                ListView.separated(
                    itemBuilder: (_, index) => state.tab == 0 ? ProjectCard(project: dummyProjects[index]) : ContributorWidget(contributor: dummyUsers[index]),
                    separatorBuilder: (_,_) => 10.verticalSpace,
                    itemCount: state.tab == 0 ? dummyProjects.length : dummyUsers.length,) :
                switch(state.searchList!.state){
                      States.initial || States.loading => Center(child: CircularProgressIndicator()),
                      States.success => state.searchList!.data!.isEmpty? Center(child: Text(AppKeywords.noResultFount)) : ListView.separated(
                        itemBuilder: (_, index) => state.tab == 0 ? ProjectCard(project: state.searchList!.data?[index]) : ContributorWidget(contributor: state.searchList!.data?[index]),
                        separatorBuilder: (_, _) => 10.verticalSpace,
                        itemCount: state.searchList!.data!.length,
                      ),
                      States.failure => Text(AppKeywords.somethingWentWrong),
                }
              ),
            ],
          ).constPaddingForPage(),
        ),
      ),
    ).fadeInUp();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
