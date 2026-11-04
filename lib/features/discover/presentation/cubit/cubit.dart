import 'package:injectable/injectable.dart';
import 'package:skill_bridge/core/base/base_cubit.dart';
import 'package:skill_bridge/features/contributor_management/data/models/collaborator_model.dart';
import 'package:skill_bridge/features/project_management/data/models/project_model.dart';

import '../../../../core/utils/resources.dart';
import 'contract.dart';

@injectable
class DiscoverCubit extends BaseCubit<DiscoverStates, DiscoverAction,void>{
  DiscoverCubit() : super(DiscoverStates());

  @override
  Future<void> doAction(DiscoverAction action) async{
    switch (action) {
      case ChangeTab():
        _changeTab(action.index);
      case Search():
        _search(action.text);
      case AddOrRemoveElementsToSkillsFilter():
        _addOrRemoveElementsToSkillsFilter(action.skill);
      case ClearSkillsFilters():
        _clearSkillsFilters();
    }
  }
  void _changeTab(int index) {
    emit(state.copyWith(tab: index));
  }

  void _search(String? text) {
    emit(state.copyWith(searchList: Resources.loading()));

    final normalizedQuery = (text ?? '').trim().toLowerCase();

    final selectedSkills = (state.skillsFilters ?? [])
        .map((skill) => skill.trim().toLowerCase())
        .toSet();

    final List<dynamic> searchList;

    if (state.tab == 0) {
      searchList = dummyProjects.where((project) {
        final matchesSearch = normalizedQuery.isEmpty ||
            project.title.toLowerCase().contains(normalizedQuery) ||
            project.description.toLowerCase().contains(normalizedQuery);

        final projectSkills = {
          ...project.requiredSkills.map((skill) => skill.skillName),
        }.map((skill) => skill.trim().toLowerCase()).toSet();

        final matchesSkills = selectedSkills.isEmpty ||
            selectedSkills.any(projectSkills.contains);

        return matchesSearch && matchesSkills;
      }).toList();
    } else {
      searchList = dummyUsers.where((contributor) {
        final matchesSearch = normalizedQuery.isEmpty ||
            contributor.name.toLowerCase().contains(normalizedQuery) ||
            contributor.title.toLowerCase().contains(normalizedQuery) ||
            contributor.bio.toLowerCase().contains(normalizedQuery);

        final contributorSkills = contributor.skills
            .map((skill) => skill.trim().toLowerCase())
            .toSet();

        final matchesSkills = selectedSkills.isEmpty ||
            selectedSkills.any(contributorSkills.contains);

        return matchesSearch && matchesSkills;
      }).toList();
    }

    emit(state.copyWith(
      searchList: Resources.success(data: searchList),
    ));
  }

  void _addOrRemoveElementsToSkillsFilter(String skill) {
    List<String> skillsFilters = state.skillsFilters ?? [];
    if(skillsFilters.contains(skill)) {
      skillsFilters.remove(skill);
    } else {
      skillsFilters.add(skill);
    }
    emit(state.copyWith(skillsFilters: skillsFilters));
  }

  void _clearSkillsFilters() {
    emit(state.copyWith(skillsFilters: []));
  }

}
