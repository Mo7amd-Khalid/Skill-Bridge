import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/di/di.dart';
import 'package:skill_bridge/core/routes/routes.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';

import '../../shared_widgets/logo_widget.dart';
import 'cubit/contract.dart';
import 'cubit/cubit.dart';


class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  final MainLayoutCubit mainLayoutCubit = getIt();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: mainLayoutCubit,
      child: BlocBuilder<MainLayoutCubit, MainLayoutStates>(
        builder:(_, state) => Scaffold(
          appBar: AppBar(
            leadingWidth: 40.w,
            title: logoWidget(),
            actions: [
              Icon(Icons.notifications_none_outlined)
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state.currentIndex,
            onTap: (index){
              if(index == 2)
                {
                  Navigator.pushNamed(context, Routes.createProjectScreen);
                }
              else if(index == 1)
                {
                  Navigator.pushNamed(context, Routes.discoverScreen);
                }
              else
                {
                  mainLayoutCubit.doAction(ChangeCurrentIndex(index));
                }
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  activeIcon: Icon(Icons.explore),
                  label: "Discover"
              ),
              // fake
              BottomNavigationBarItem(icon: Icon(Icons.add, color: AppColors.darkCanvas), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline),
                  activeIcon: Icon(Icons.chat_bubble),
                  label: "Messages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  activeIcon: Icon(Icons.person_2),
                  label: "Profile"),
            ],
          ),
          body: state.screens[state.currentIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton:  MediaQuery.of(context).viewInsets.bottom > 0
              ? null
              : FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, Routes.createProjectScreen);
            }, child: Icon(Icons.add, color: AppColors.black,),
          ),
        ),
      ),
    );
  }
}
