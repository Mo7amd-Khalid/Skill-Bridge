import 'package:injectable/injectable.dart';
import 'package:skill_bridge/core/base/base_cubit.dart';
import 'package:skill_bridge/features/contributor_management/data/models/collaborator_model.dart';
import 'package:skill_bridge/features/project_management/presentation/create_project/cubit/contract.dart';

import '../../../../../core/const/skills_list.dart';

@injectable
class CreateProjectCubit extends BaseCubit<CreateProjectState, CreateProjectActions, void>{
  CreateProjectCubit() : super(CreateProjectState());

  @override
  Future<void> doAction(CreateProjectActions action) async{
    switch (action) {
      case GetAllSkills():
        _getAllSkills();
      case SearchContributor():
        _searchContributor(action.text);
      case AddContributor():
        _addContributor(action.contributor);
      case RemoveContributor():
        _removeContributor(action.contributor);
      case ChooseExistedSkill():
        _chooseSkill(action.selectedSkill);
      case AddExistedSkill():
        _addExistedSkill(action.existedSkill);
      case RemoveExistedSkill():
        _removeExistedSkill(action.existedSkill);
      case ChooseRequiredSkill():
        _chooseRequiredSkill(action.selectedSkill);
      case AddRequiredSkill():
        _addRequiredSkill(action.requiresSkill);
      case RemoveRequiredSkill():
        _removeRequiredSkill(action.requiresSkill);
      case IncreaseNumberOfRequiredMembers():
        _increaseNumberOfRequiredMembers(action.requiresSkill);
      case DecreaseNumberOfRequiredMembers():
        _decreaseNumberOfRequiredMembers(action.requiresSkill);
    }
  }

  void _addContributor(ContributorModel contributor) {
    final selectedContributors = (state.selectedContributors ?? []);
    selectedContributors.add(contributor);
    emit(state.copyWith(selectedContributors: selectedContributors));
  }

  void _searchContributor(String text) {
    final searchContributors = (state.searchContributors ?? []);
    searchContributors.clear();
    searchContributors.addAll(dummyUsers.where((element) => element.name.toLowerCase().contains(text.toLowerCase())));
    emit(state.copyWith(searchContributors: searchContributors));
  }

  void _removeContributor(ContributorModel contributor) {
    final selectedContributors = (state.selectedContributors ?? []);
    selectedContributors.remove(contributor);
    emit(state.copyWith(selectedContributors: selectedContributors));
  }

  void _getAllSkills() {
    final allSkills = (state.allSkills ?? []);
    allSkills.clear();
    allSkills.addAll(skillsList);
    emit(state.copyWith(allSkills: allSkills));
  }

  void _chooseSkill(String selectedSkill) {
    emit(state.copyWith(selectedSkill: selectedSkill));
  }

  void _addExistedSkill(String existedSkill) {
    if (state.selectedExistedSkill == null) return;

    final existedSkills = [
      ...?state.existedSkills,
      existedSkill,
    ];

    final allSkills = (state.allSkills ?? [])
        .where((skill) => skill != existedSkill)
        .toList();

    emit(state.copyWith(
      existedSkills: existedSkills,
      allSkills: allSkills,
      selectedSkill: null,
      dropdownResetVersion: state.dropdownResetVersion + 1,
    ));
  }

  void _removeExistedSkill(String existedSkill) {
    final existedSkills = (state.existedSkills ?? [])
        .where((skill) => skill != existedSkill)
        .toList();

    final allSkills = [
      ...?state.allSkills,
      existedSkill,
    ];

    emit(state.copyWith(
      existedSkills: existedSkills,
      allSkills: allSkills,
    ));
  }

  void _chooseRequiredSkill(String selectedSkill) {
    emit(state.copyWith(selectedRequiredSkill: selectedSkill));
  }

  void _addRequiredSkill(String requiredSkill) {
    if(state.selectedRequiredSkill == null) return;
    final requiredSkills = {
      ...?state.requiredSkills,
      requiredSkill: 1,
    };

    final allSkills = (state.allSkills ?? [])
        .where((item) => item != requiredSkill)
        .toList();

    emit(state.copyWith(
      requiredSkills: requiredSkills,
      allSkills: allSkills,
      selectedSkill: null,
      dropdownResetVersion: state.dropdownResetVersion + 1,
    ));
  }

  void _removeRequiredSkill(String requiredSkill) {
    final requiredSkills = Map<String, int>.from(
      state.requiredSkills!.cast<String, int >(),
    )..remove(requiredSkill);

    final allSkills = [
      ...?state.allSkills,
      requiredSkill,
    ];

    emit(state.copyWith(
      requiredSkills: requiredSkills,
      allSkills: allSkills,
    ));
  }

  void _increaseNumberOfRequiredMembers(String requiredSkill) {
    final requiredSkills = Map<String, int>.from(
      state.requiredSkills!.cast<String, int >(),
    )..update(requiredSkill, (value) => value + 1);
    emit(state.copyWith(requiredSkills: requiredSkills));
  }

  void _decreaseNumberOfRequiredMembers(String requiredSkill) {
    if(state.requiredSkills![requiredSkill] == 1) return;

    final requiredSkills = Map<String, int>.from(
      state.requiredSkills!.cast<String, int >(),
    )..update(requiredSkill, (value) => value - 1);
    emit(state.copyWith(requiredSkills: requiredSkills));
  }


}