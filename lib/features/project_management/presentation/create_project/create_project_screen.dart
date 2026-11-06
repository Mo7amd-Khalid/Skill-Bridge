import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/features/contributor_management/data/models/collaborator_model.dart';
import 'package:skill_bridge/features/project_management/presentation/create_project/cubit/cubit.dart';
import 'package:skill_bridge/features/shared_widgets/custom_textFormField.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../validation/data_validation.dart';
import 'cubit/contract.dart';

class CreateProjectScreen extends StatefulWidget {
  const CreateProjectScreen({super.key});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchForContributorController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CreateProjectCubit createProjectCubit = getIt();

  @override
  void initState() {
    createProjectCubit.doAction(GetAllSkills());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppKeywords.createNewProject),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: BlocProvider.value(
          value: createProjectCubit,
          child: BlocBuilder<CreateProjectCubit, CreateProjectState>(
            builder:(_, state) => Form(
              key: formKey,
              child: Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    controller: titleController,
                    title: AppKeywords.title,
                    keyboardType: TextInputType.text,
                    validator: (value){
                      return DataValidation.titleForProjectValidation(value!);
                    },
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.darkTextMuted),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.darkTextMuted),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.error),
                    ),
                    hint: Text(
                      AppKeywords.writeTheTitleOfTheProject,
                      style: AppTextStyles.text14w400.copyWith(
                        color: AppColors.darkTextMuted,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: descriptionController,
                    title: AppKeywords.description,
                    keyboardType: TextInputType.text,
                    numOFLines: 5,
                    validator: (value){
                      return DataValidation.descriptionForProjectValidation(value!);
                    },
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.darkTextMuted),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.darkTextMuted),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: AppColors.error),
                    ),
                    hint: Text(
                    AppKeywords.writeTheDescriptionOfTheProject,
                      style: AppTextStyles.text14w400.copyWith(
                        color: AppColors.darkTextMuted,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Text(AppKeywords.projectSkills, style: AppTextStyles.text16w400,),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.darkSurfaceElevated,
                      borderRadius: BorderRadiusGeometry.circular(8)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppKeywords.existingSkills),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.darkSurfaceElevated,
                            borderRadius: BorderRadiusGeometry.circular(8)
                          ),
                          child: Column(
                            spacing: 10.h,
                            children: [
                              DropdownButtonFormField<String>(
                                key: ValueKey(state.dropdownResetVersion),
                                isExpanded: false,
                                initialValue: null,
                                decoration: InputDecoration(
                                  hintText: 'Select a skill...',
                                  prefixIcon: Icon(Icons.code),
                                ),
                                items: state.allSkills!.map((skill) {
                                  return DropdownMenuItem<String>(
                                    value: skill,
                                    child: Text(skill),
                                  );
                                }).toList(),
                                onChanged: (value){
                                  createProjectCubit.doAction(ChooseExistedSkill(selectedSkill: value!));
                                },
                              ),
                              if(state.existedSkills != null && state.existedSkills!.isNotEmpty)
                                ListView.separated(
                                  shrinkWrap: true,
                                    itemBuilder: (_, index) => ListTile(
                                      title: Text(state.existedSkills![index]),
                                      contentPadding: EdgeInsets.zero,
                                      minTileHeight: 0,
                                      trailing: IconButton(onPressed: (){
                                        createProjectCubit.doAction(RemoveExistedSkill(existedSkill: state.existedSkills![index]));
                                      }, icon: Icon(Icons.close, color: AppColors.error,)),
                                    ),
                                    separatorBuilder: (_, _) => 10.verticalSpace,
                                    itemCount: state.existedSkills!.length),
                              FilledButton(
                                  onPressed: (){
                                    if(state.selectedExistedSkill != null)
                                      {
                                        createProjectCubit.doAction(AddExistedSkill(existedSkill: state.selectedExistedSkill!));
                                      }
                                  },
                                style: FilledButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(8)
                                  )
                                ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                Icon(Icons.add),
                                Text("Add skills")
                              ],),
                              )
                            ],
                          ),
                        ),

                        Text(AppKeywords.requiredSkills),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.darkSurfaceElevated,
                              borderRadius: BorderRadiusGeometry.circular(8)
                          ),
                          child: Column(
                            spacing: 10.h,
                            children: [
                              DropdownButtonFormField<String>(
                                key: ValueKey(state.dropdownResetVersion),
                                isExpanded: false,
                                initialValue: null,
                                decoration: InputDecoration(
                                  hintText: 'Select a skill...',
                                  prefixIcon: Icon(Icons.code),
                                ),
                                items: state.allSkills!.map((skill) {
                                  return DropdownMenuItem<String>(
                                    value: skill,
                                    child: Text(skill),
                                  );
                                }).toList(),
                                onChanged: (value){
                                  createProjectCubit.doAction(ChooseRequiredSkill(selectedSkill: value!));
                                },
                              ),
                              if(state.requiredSkills != null && state.requiredSkills!.isNotEmpty)
                                ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      final entry = state.requiredSkills!.entries.elementAt(index);
                                      return Row(
                                      children: [
                                        Expanded(child: Text(entry.key)),
                                        Row(
                                          children: [
                                            IconButton(onPressed: (){
                                              createProjectCubit.doAction(DecreaseNumberOfRequiredMembers(requiresSkill: entry.key));
                                            }, icon: Icon(Icons.remove)),
                                            Text(entry.value.toString()),
                                            IconButton(onPressed: (){
                                              createProjectCubit.doAction(IncreaseNumberOfRequiredMembers(requiresSkill: entry.key));
                                            }, icon: Icon(Icons.add)),

                                          ],
                                        ),
                                        IconButton(onPressed: (){
                                          createProjectCubit.doAction(RemoveRequiredSkill(requiresSkill: entry.key));
                                        }, icon: Icon(Icons.close, color: AppColors.error,))
                                      ],
                                    );
                                    },
                                    separatorBuilder: (_, _) => 10.verticalSpace,
                                    itemCount: state.requiredSkills!.length),
                              FilledButton(
                                onPressed: (){
                                  if(state.selectedRequiredSkill != null)
                                  {
                                    createProjectCubit.doAction(AddRequiredSkill(requiresSkill: state.selectedRequiredSkill!));
                                  }
                                },
                                style: FilledButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusGeometry.circular(8)
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    Text("Add skills")
                                  ],),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(AppKeywords.selectedContributors),
                  if(state.selectedContributors != null && state.selectedContributors!.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.darkSurfaceElevated,
                          borderRadius: BorderRadiusGeometry.circular(8)
                      ),
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (_, index) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            minTileHeight: 0,
                            title: Text(state.selectedContributors![index].name, style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp),),
                            subtitle: Text(state.selectedContributors![index].title, style: AppTextStyles.text12w400.copyWith(color: AppColors.darkTextMuted, fontSize: 12.sp),),
                            trailing: IconButton(onPressed: (){
                              createProjectCubit.doAction(RemoveContributor(contributor: state.selectedContributors![index]));
                            }, icon: Icon(Icons.close)),
                          ),
                          separatorBuilder: (_, _) => 10.verticalSpace,
                          itemCount: state.selectedContributors!.length),
                    ),
                  Text(AppKeywords.availableContributors),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.darkSurfaceElevated,
                        borderRadius: BorderRadiusGeometry.circular(8)
                    ),
                    child: Column(
                      children: [
                        CustomTextFormField(
                            controller: searchForContributorController,
                            title: AppKeywords.searchForContributor,
                            keyboardType: TextInputType.text,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.darkTextMuted),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.darkTextMuted),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.error),
                            ),
                            hint: Text(
                              "Mohamed Khaled",
                              style: AppTextStyles.text14w400.copyWith(
                                color: AppColors.darkTextMuted,
                                fontSize: 14.sp,
                              ),


                        ),
                          onChanged: (value){
                              createProjectCubit.doAction(SearchContributor(text: value));
                          },
                        ),
                        SizedBox(
                          height: 200.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                              itemBuilder: (_, index) => CheckboxMenuButton(
                                  value: state.searchContributors != null ?
                                  state.selectedContributors?.contains(state.searchContributors![index]) ?? false :
                                  state.selectedContributors?.contains(dummyUsers[index]) ?? false,
                                  onChanged: (contributor){
                                    if(contributor!)
                                      {
                                        createProjectCubit.doAction(AddContributor(contributor: state.searchContributors != null ? state.searchContributors![index] : dummyUsers[index]));
                                      }
                                    else
                                      {
                                        createProjectCubit.doAction(RemoveContributor(contributor: state.searchContributors != null ? state.searchContributors![index] : dummyUsers[index]));
                                      }
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.searchContributors != null ? state.searchContributors![index].name : dummyUsers[index].name,
                                        style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp),),
                                      Text(
                                        state.searchContributors != null ? state.searchContributors![index].title : dummyUsers[index].title,
                                        style: AppTextStyles.text12w400.copyWith(color: AppColors.darkTextMuted, fontSize: 12.sp),),
                                    ],
                                  )),
                              separatorBuilder: (_, _) => 10.verticalSpace,
                              itemCount: state.searchContributors != null ? state.searchContributors!.length : dummyUsers.length),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.success,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8)
                        )
                      ),
                        onPressed: (){
                        if(formKey.currentState!.validate() && state.selectedRequiredSkill!.isNotEmpty)
                          {
                            // create the project
                          }
                        },
                        child: Text(AppKeywords.createProject)
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ).fadeInUp();
  }
}
// عاوز اشيل الskill من ال list سواء  exist & required