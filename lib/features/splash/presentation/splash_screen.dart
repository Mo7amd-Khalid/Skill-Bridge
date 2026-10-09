import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_bridge/core/const/assets.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/theme/app_text_styles.dart';

import '../../../core/const/sharedPreferencesKeys.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferences preferences = getIt();
  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      if(preferences.getBool(SharedPreferencesKeys.onboardingKey)??false)
        {
          if(preferences.getBool(SharedPreferencesKeys.loginKey)??false)
            {
              Navigator.pushReplacementNamed(context, Routes.mainLayoutScreen);
            }
          else
            {
              Navigator.pushReplacementNamed(context, Routes.loginScreen);
            }
        }
      else
        {
          Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(),
          SizedBox(
            width: double.infinity,
            child: Column(
              spacing: 5,
              children: [
                Image.asset(AppImages.logo, width: 220.w, height: 220.h),
                Column(
                  children: [
                    Text(AppKeywords.appName, style: AppTextStyles.text18w600.copyWith(fontSize: 18.sp,color: AppColors.white),),
                    Text(AppKeywords.descriptionForSplash, style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp, color: AppColors.darkTextMuted),),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 100.w,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(1000),
              color: AppColors.primary,
              backgroundColor: AppColors.darkBorder,
            ),
          )
        ],
      ).fadeIn(),
    );
  }
}
