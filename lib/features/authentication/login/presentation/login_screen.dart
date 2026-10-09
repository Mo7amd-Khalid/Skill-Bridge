import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/theme/app_text_styles.dart';
import 'package:skill_bridge/features/authentication/login/presentation/cubit/contract.dart';
import 'package:skill_bridge/features/authentication/login/presentation/cubit/cubit.dart';
import 'package:skill_bridge/features/shared_widgets/get_strenght_of-password.dart';
import 'package:skill_bridge/features/shared_widgets/password_requirements.dart';
import 'package:skill_bridge/features/validation/data_validation.dart';
import '../../../shared_widgets/custom_textFormField.dart';
import '../../../shared_widgets/logo_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LoginCubit loginCubit = getIt();


  @override
  void initState() {
    loginCubit.navigation.listen((event) {
      switch(event){
        case NavigateToToHomeScreen():
          Navigator.pushNamedAndRemoveUntil(context, Routes.mainLayoutScreen, (route) => false);
        case NavigateToToRegisterScreen():
          Navigator.pushNamed(context, Routes.registerScreen);
        case NavigateToToForgetPasswordScreen():
          Navigator.pushNamed(context, Routes.forgetPasswordScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: logoWidget(), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: BlocProvider.value(
          value: loginCubit,
          child: BlocBuilder<LoginCubit, LoginStates>(
            builder:(_, state) => Form(
              key: formKey,
              child: Column(
                spacing: 6,
                children: [
                  Text(
                    AppKeywords.welcomeMessageForLogin,
                    style: AppTextStyles.text26w600.copyWith(fontSize: 26.sp),
                  ),
                  Text(
                    AppKeywords.descriptionForLogin,
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
                            loginCubit.doAction(ChangePasswordValue(val));
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
                              loginCubit.doAction(ChangeObscured());
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
                        Row(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: state.reminderMe,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  activeColor: AppColors.primary,
                                  checkColor: AppColors.white,
                                  side: BorderSide(
                                    color: AppColors.darkTextMuted,
                                    width: 1,
                                  ),
                                  onChanged: (val) {
                                    loginCubit.doAction(ChangeReminderMe());
                                  },
                                ),
                                Text(
                                  AppKeywords.reminderMe,
                                  style: AppTextStyles.text14w400.copyWith(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                loginCubit.doAction(GoToForgetPasswordScreen());
                              },
                              child: Text(
                                AppKeywords.forgetPassword,
                                style: AppTextStyles.text14w400.copyWith(
                                  color: AppColors.primaryTint(100),
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              if(formKey.currentState!.validate() && GetStrengthOfPassword.strength(state.password??"") == 5)
                                {
                                  loginCubit.doAction(GoToHomeScreen());
                                }
                            },
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(12),
                              ),
                            ),
                            child: Text(
                              AppKeywords.login,
                              style: AppTextStyles.text14w400.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Text(
                        AppKeywords.goAsAGuest,
                        style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ).fadeIn(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppKeywords.dontHaveAccount,
            style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp),
          ),
          TextButton(
            onPressed: () {
              loginCubit.doAction(GoToRegisterScreen());
            },
            child: Text(
              AppKeywords.signUp,
              style: AppTextStyles.text14w400.copyWith(
                color: AppColors.primaryTint(100),
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

