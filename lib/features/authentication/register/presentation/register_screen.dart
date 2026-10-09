import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/features/authentication/register/presentation/cubit/cubit.dart';
import '../../../../core/const/keywords.dart';
import '../../../../core/const/skills_list.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../shared_widgets/custom_textFormField.dart';
import '../../../shared_widgets/get_strenght_of-password.dart';
import '../../../shared_widgets/logo_widget.dart';
import '../../../shared_widgets/password_requirements.dart';
import '../../../validation/data_validation.dart';
import 'cubit/contract.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final RegisterCubit registerCubit = getIt();

  @override
  void initState() {
    registerCubit.navigation.listen((event) {
      switch(event){
        case NavigateToLoginScreen():
          Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
      }
    });
    registerCubit.state.skills = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40.w,
        title: logoWidget(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: BlocProvider.value(
          value: registerCubit,
          child: BlocBuilder<RegisterCubit, RegisterStates>(
            builder:(_, state) => Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6.h,
                children: [
                  Text(
                    AppKeywords.welcomeMessageForRegister,
                    style: AppTextStyles.text26w600.copyWith(fontSize: 26.sp),
                  ),
                  Text(
                    AppKeywords.descriptionForRegister,
                    style: AppTextStyles.text16w400.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.darkTextMuted,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.darkSurfaceElevated,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: nameController,
                          validator: (value){
                            return DataValidation.nameValidation(value!);
                          },
                          title: AppKeywords.name,
                          keyboardType: TextInputType.name,
                          prefix: Icon(
                            Icons.person_2_outlined,
                            color: AppColors.darkTextMuted,
                          ),
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
                            AppKeywords.hintForName,
                            style: AppTextStyles.text14w400.copyWith(
                              color: AppColors.darkTextMuted,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          validator: (value){
                            return DataValidation.emailValidation(value!);
                          },
                          title: AppKeywords.email,
                          keyboardType: TextInputType.emailAddress,
                          prefix: Icon(
                            Icons.email_outlined,
                            color: AppColors.darkTextMuted,
                          ),
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
                            AppKeywords.hintForEmail,
                            style: AppTextStyles.text14w400.copyWith(
                              color: AppColors.darkTextMuted,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        CustomTextFormField(
                          onChanged: (val) {
                            registerCubit.doAction(ChangePasswordValue(val));
                          },
                          controller: passwordController,
                          title: AppKeywords.password,
                          isObscured: state.isObscured,
                          keyboardType: TextInputType.visiblePassword,
                          prefix: Icon(
                            Icons.lock_outline,
                            color: AppColors.darkTextMuted,
                          ),
                          suffix: IconButton(
                            onPressed: () {
                              registerCubit.doAction(ChangeObscured());
                            },
                            icon: Icon(
                              state.isObscured? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: AppColors.darkTextMuted,
                            ),
                          ),
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
                            AppKeywords.hintForPassword,
                            style: AppTextStyles.text14w400.copyWith(
                              color: AppColors.darkTextMuted,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            int strength = GetStrengthOfPassword.strength(state.password??"");
                            final isActive = index < strength;

                            return Expanded(
                              child: Container(
                                height: 4.h,
                                margin: EdgeInsets.only(right: index == 4 ? 0 : 3),
                                color: isActive
                                    ? (strength <= 2
                                    ? AppColors.error
                                    : strength <= 4
                                    ? AppColors.warning
                                    : AppColors.success)
                                    : AppColors.darkTextSecondary,
                              ),
                            );
                          }),
                        ),
                        if(state.password != null && state.password!.isNotEmpty)
                          passwordRequirements(
                              hasUppercase: GetStrengthOfPassword.hasUppercase(state.password!),
                              hasLowercase: GetStrengthOfPassword.hasLowercase(state.password!),
                              hasDigit: GetStrengthOfPassword.hasDigit(state.password!),
                              hasSpecialCharacter: GetStrengthOfPassword.hasSpecialCharacter(state.password!),
                              hasMinLength: GetStrengthOfPassword.hasMinLength(state.password!)
                          ),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          validator: (value){
                            return DataValidation.rePasswordValidation(value!, passwordController.text);
                          },
                          title: AppKeywords.confirmationPassword,
                          isObscured: state.isObscured,
                          keyboardType: TextInputType.visiblePassword,
                          prefix: Icon(
                            Icons.lock_outline,
                            color: AppColors.darkTextMuted,
                          ),
                          suffix: IconButton(
                            onPressed: () {
                              registerCubit.doAction(ChangeObscured());
                            },
                            icon: Icon(
                              state.isObscured? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: AppColors.darkTextMuted,
                            ),
                          ),
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
                            AppKeywords.hintForPassword,
                            style: AppTextStyles.text14w400.copyWith(
                              color: AppColors.darkTextMuted,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Text(AppKeywords.skills, style: AppTextStyles.text13w500.copyWith(fontSize: 13.sp)),
                        Container(
                          padding: EdgeInsets.all(12),
                          height: 300.h,
                          decoration: BoxDecoration(
                            color: AppColors.darkSurface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.darkTextMuted,
                            )
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (_, index) => Material(
                              color: Colors.transparent,
                              child: CheckboxListTile(
                                value: (state.skills??[]).contains(skillsList[index]),
                                title: Text(skillsList[index]),
                                checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(8)
                                ),
                                checkboxScaleFactor: 1.2,
                                activeColor: AppColors.primary,
                                checkColor: AppColors.white,
                                side: BorderSide(
                                  color: AppColors.darkTextMuted,
                                  width: 1,
                                ),
                                controlAffinity: ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                onChanged: (value) {
                                  if(value!)
                                  {
                                    registerCubit.doAction(AddToSkills(skillsList[index]));
                                  }
                                  else
                                  {
                                    registerCubit.doAction(RemoveFromSkills(skillsList[index]));
                                  }

                                },
                              ),
                            ),
                            itemCount: skillsList.length,
                              ),
                            ),

                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              if(formKey.currentState!.validate() && GetStrengthOfPassword.strength(state.password??"") == 5)
                              {
                                registerCubit.doAction(GoToLoginScreen());
                              }
                            },
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(12),
                              ),
                            ),
                            child: Text(
                              AppKeywords.register,
                              style: AppTextStyles.text14w400.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
