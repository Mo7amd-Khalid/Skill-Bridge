import 'package:flutter/material.dart';

import '../../../../contributor_management/data/models/collaborator_model.dart';


class RegisterStates {
  final bool isObscured;
  final String? password;
  List<String>? skills;
  ExperienceLevel? selectedLevel;
  Map<String, String>? linksOfPreviousProjects;
  int workingHoursPerDay;

  RegisterStates({
    this.isObscured = true,
    this.password,
    this.skills = const [],
    this.selectedLevel,
    this.linksOfPreviousProjects,
    this.workingHoursPerDay = 1
  });

  RegisterStates copyWith({
    bool? isObscured,
    String? password,
    List<String>? skills,
    ExperienceLevel? selectedLevel,
    Map<String, String>? linksOfPreviousProjects,
    int? workingHoursPerDay
  }) {
    return RegisterStates(
      isObscured: isObscured ?? this.isObscured,
      password: password ?? this.password,
      skills: skills ?? this.skills,
      selectedLevel: selectedLevel ?? this.selectedLevel,
      linksOfPreviousProjects: linksOfPreviousProjects ?? this.linksOfPreviousProjects,
      workingHoursPerDay: workingHoursPerDay ?? this.workingHoursPerDay,
    );
  }
}

sealed class RegisterActions {}

class ChangeObscured extends RegisterActions {}

class ChangePasswordValue extends RegisterActions {
  final String value;

  ChangePasswordValue(this.value);
}

class GoToLoginScreen extends RegisterActions {}

class AddToSkills extends RegisterActions {
  final String skill;

  AddToSkills(this.skill);
}

class SelectExperienceLevel extends RegisterActions {
  ExperienceLevel level;

  SelectExperienceLevel(this.level);
}

class RemoveFromSkills extends RegisterActions {
  final String skill;

  RemoveFromSkills(this.skill);
}

class AddToPreviousProjects extends RegisterActions {
  BuildContext context;
  String link;
  String linkName;
  AddToPreviousProjects(this.context,{required this.linkName, required this.link});
}

class RemoveFromPreviousProjects extends RegisterActions {
  String linkName;
  RemoveFromPreviousProjects(this.linkName);
}

class ChangeWorkingHoursPerDay extends RegisterActions {
  int hours;
  ChangeWorkingHoursPerDay(this.hours);
}

sealed class RegisterNavigations {}

class NavigateToLoginScreen extends RegisterNavigations {}
