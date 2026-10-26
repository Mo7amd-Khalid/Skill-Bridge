import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import '../../../../../core/base/base_cubit.dart';
import '../../../../collaborators_management/data/models/collaborator_model.dart';
import 'contract.dart';

@injectable
class RegisterCubit
    extends BaseCubit<RegisterStates, RegisterActions, RegisterNavigations> {
  RegisterCubit() : super(RegisterStates());

  @override
  Future<void> doAction(RegisterActions action) async {
    switch (action) {
      case ChangeObscured():
        _changeObscured();
      case ChangePasswordValue():
        _changePasswordValue(action.value);
      case GoToLoginScreen():
        _goToLoginScreen();
      case AddToSkills():
        _addToSkills(action.skill);
      case RemoveFromSkills():
        _removeFromSkills(action.skill);
      case SelectExperienceLevel():
        _selectExperienceLevel(action.level);
      case AddToPreviousProjects():
        _addToPreviousProjects(action.context, action.link, action.linkName);
      case RemoveFromPreviousProjects():
        _removeFromPreviousProjects(action.linkName);
      case ChangeWorkingHoursPerDay():
        _changeWorkingHoursPerDay(action.hours);
    }
  }

  void _changeObscured() {
    emit(state.copyWith(isObscured: !state.isObscured));
  }

  void _changePasswordValue(String value) {
    emit(state.copyWith(password: value));
  }

  void _goToLoginScreen() {
    emitNavigation(NavigateToLoginScreen());
  }

  void _addToSkills(String skill) {
    emit(state.copyWith(skills: (state.skills ?? [])..add(skill)));
  }

  void _selectExperienceLevel(ExperienceLevel level) {
    emit(state.copyWith(selectedLevel: level));
  }

  void _removeFromSkills(String skill) {
    emit(state.copyWith(skills: (state.skills ?? [])..remove(skill)));
  }

  void _addToPreviousProjects(
    BuildContext context,
    String link,
    String linkName,
  ) {
    if ((state.linksOfPreviousProjects ?? {}).containsKey(linkName)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
          SnackBar(
          content: Text(AppKeywords.addLinkErrorMessage),
        backgroundColor: AppColors.error,
        showCloseIcon: true,
      ));
    }
    else
      {
        Map<String, String> newMap = state.linksOfPreviousProjects ?? {};
        newMap.addAll({linkName: link});
        emit(state.copyWith(linksOfPreviousProjects: newMap));
      }

  }

  void _removeFromPreviousProjects(String linkName) {
    Map<String, String> newMap = state.linksOfPreviousProjects ?? {};
    newMap.remove(linkName);
    emit(state.copyWith(linksOfPreviousProjects: newMap));
  }

  void _changeWorkingHoursPerDay(int hours) {
    emit(state.copyWith(workingHoursPerDay: hours));
  }
}
