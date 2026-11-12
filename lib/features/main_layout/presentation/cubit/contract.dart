import 'package:flutter/material.dart';
import 'package:skill_bridge/features/conversations_and_chats/presentation/conversations_screen/conversations_screen.dart';
import 'package:skill_bridge/features/project_management/presentation/home/home_screen.dart';

class MainLayoutStates{
  int currentIndex;
  List<Widget> screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    ConversationsScreen(),
    Scaffold(),
  ];
  MainLayoutStates({this.currentIndex = 0});

  MainLayoutStates copyWith({int? currentIndex}) {
    return MainLayoutStates(currentIndex: currentIndex ?? this.currentIndex);
  }
}

sealed class MainLayoutActions{}
class ChangeCurrentIndex extends MainLayoutActions{
  int newIndex;
  ChangeCurrentIndex(this.newIndex);
}

sealed class MainLayoutNavigations{}