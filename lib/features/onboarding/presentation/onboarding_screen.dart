import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/const/assets.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/padding.dart';
import 'package:skill_bridge/features/onboarding/presentation/cubit/cubit.dart';

import '../../../core/routes/routes.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../shared_widgets/indicator_for_pages.dart';
import 'cubit/contract.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final OnboardingCubit cubit = getIt();
  final PageController pageController = PageController();
  @override
  void initState() {
    cubit.navigation.listen((event){
      switch (event) {
        case NavigateToLogin():
          Navigator.pushNamedAndRemoveUntil(context, Routes.loginScreen, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: cubit,
          child: BlocBuilder<OnboardingCubit, OnboardingStates>(
            builder:(context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8.w,
                  children: [
                    Image.asset(AppImages.logo, width: 32.w, height: 32.h),
                    Text(AppKeywords.appName,style: AppTextStyles.text18w600.copyWith(
                      fontSize: 18.sp
                    ),),
                    Spacer(),
                    TextButton(onPressed: (){
                      cubit.doAction(GoToMainLayout());
                    }, child: Text(AppKeywords.skip, style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp,color: AppColors.white),)),
                  ],
                ),

                SizedBox(
                  height: 400.h,
                  child: PageView.builder(
                    controller: pageController,
                    itemBuilder: (context, index) => Image.asset(
                      state.onboardingList[index].image,
                      width: 340.w,
                      height: 280.h,
                    ),
                    itemCount: state.onboardingList.length,
                    onPageChanged: (index){
                      cubit.doAction(ChangePage(index));
                    },
                  ),
                ),
                Column(
                  spacing: 24.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndicatorForPages(
                      length: state.onboardingList.length,
                      isSelectedIndex: state.currentIndex,
                    ),
                    Text(state.onboardingList[state.currentIndex].title, style: AppTextStyles.text26w600.copyWith(fontSize: 26.sp),),
                    Text(state.onboardingList[state.currentIndex].description, style: AppTextStyles.text14w400.copyWith(fontSize:14.sp,color: AppColors.darkTextMuted),),
                  ],
                ),
                FilledButton(
                    onPressed: (){
                      if(state.currentIndex == state.onboardingList.length - 1)
                        {
                          cubit.doAction(GoToMainLayout());
                        }
                      else {
                        pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                      }
                    },
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12)
                      ) 
                    ),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8.w,
                  children: [
                    Text(
                      state.currentIndex == state.onboardingList.length - 1 ? AppKeywords.getStarted: AppKeywords.next,
                      style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp),),
                    Icon(Icons.arrow_forward_sharp,),
                  ],
                )
                ),
              ],
            ),
          ),
        ),
      ).constPaddingForPage(),
    );
  }
}
