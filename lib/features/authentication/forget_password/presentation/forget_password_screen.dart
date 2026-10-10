import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/features/authentication/forget_password/presentation/cubit/cubit.dart';
import '../../../../core/const/keywords.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../shared_widgets/custom_textFormField.dart';
import '../../../shared_widgets/logo_widget.dart';
import '../../../validation/data_validation.dart';
import 'cubit/contract.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  String _formattedTime(int remainingSeconds) {
    final minutes = (remainingSeconds ~/ 60)
        .toString()
        .padLeft(2, '0');
    final seconds = (remainingSeconds % 60)
        .toString()
        .padLeft(2, '0');

    return '$minutes:$seconds';
  }

  ForgetPasswordCubit forgetPasswordCubit = getIt();

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
          value: forgetPasswordCubit,
          child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
            builder: (_, state) => Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    AppKeywords.welcomeMessageForReset,
                    style: AppTextStyles.text26w600.copyWith(fontSize: 26.sp),
                  ),
                  Text(
                    AppKeywords.descriptionForReset,
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
                        if(state.waitForResendAgain!)
                          Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.darkSurface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12,
                            children: [
                              Icon(Icons.info_outline_rounded, color: AppColors.secondary, size: 20.r,),
                              Expanded(
                                child: Text(
                                    AppKeywords.messageForResendLink,
                                 style: AppTextStyles.text12w400.copyWith(
                                   height: 1.5
                                 ),
                                ),
                              )
                            ],
                          ),
                        ),

                        state.waitForResendAgain!? Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(_formattedTime(state.reminderTime!), textAlign: TextAlign.center,),
                        ) : SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              if(formKey.currentState!.validate())
                                {
                                  forgetPasswordCubit.doAction(WaitForResendLinkMode());
                                }
                            },
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(12),
                              ),
                            ),
                            autofocus: false,
                            child: Text(
                              AppKeywords.sendResetLink,
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
    emailController.dispose();
    super.dispose();
  }
}
