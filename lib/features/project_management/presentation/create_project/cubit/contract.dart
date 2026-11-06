import 'package:skill_bridge/features/contributor_management/data/models/collaborator_model.dart';

class CreateProjectState{
  final List<ContributorModel>? selectedContributors;
  final List<ContributorModel>? searchContributors;
  final List<String>? allSkills;
  final String? selectedExistedSkill;
  final List<String>? existedSkills;
  final String? selectedRequiredSkill;
  final Map<String, int>? requiredSkills;
  final int dropdownResetVersion;


 CreateProjectState({
    this.selectedContributors,
    this.searchContributors,
   this.allSkills,
   this.selectedExistedSkill,
   this.existedSkills,
   this.requiredSkills,
   this.dropdownResetVersion = 0,
   this.selectedRequiredSkill,
  });

  CreateProjectState copyWith({
    List<ContributorModel>? selectedContributors,
    List<ContributorModel>? searchContributors,
    List<String>? allSkills,
    String? selectedSkill,
    List<String>? existedSkills,
    Map<String, int>? requiredSkills,
    int? dropdownResetVersion,
    String? selectedRequiredSkill,
  }){
    return CreateProjectState(
      selectedContributors: selectedContributors ?? this.selectedContributors,
      searchContributors: searchContributors ?? this.searchContributors,
      allSkills: allSkills ?? this.allSkills,
      selectedExistedSkill: selectedSkill ?? this.selectedExistedSkill,
      existedSkills: existedSkills ?? this.existedSkills,
      requiredSkills: requiredSkills ?? this.requiredSkills,
      dropdownResetVersion: dropdownResetVersion ?? this.dropdownResetVersion,
      selectedRequiredSkill: selectedRequiredSkill ?? this.selectedRequiredSkill,
    );
  }
}

sealed class CreateProjectActions{}
class GetAllSkills extends CreateProjectActions{}
class ChooseExistedSkill extends CreateProjectActions{
  String selectedSkill;
  ChooseExistedSkill({required this.selectedSkill});
}
class AddExistedSkill extends CreateProjectActions{
  String existedSkill;
  AddExistedSkill({required this.existedSkill});
}
class RemoveExistedSkill extends CreateProjectActions{
  String existedSkill;
  RemoveExistedSkill({required this.existedSkill});
}

class ChooseRequiredSkill extends CreateProjectActions{
  String selectedSkill;
  ChooseRequiredSkill({required this.selectedSkill});
}
class AddRequiredSkill extends CreateProjectActions{
  String requiresSkill;
  AddRequiredSkill({required this.requiresSkill});
}
class IncreaseNumberOfRequiredMembers extends CreateProjectActions{
  String requiresSkill;
  IncreaseNumberOfRequiredMembers({required this.requiresSkill});
}
class DecreaseNumberOfRequiredMembers extends CreateProjectActions{
  String requiresSkill;
  DecreaseNumberOfRequiredMembers({required this.requiresSkill});
}
class RemoveRequiredSkill extends CreateProjectActions{
  String requiresSkill;
  RemoveRequiredSkill({required this.requiresSkill});
}


class AddContributor extends CreateProjectActions{
  final ContributorModel contributor;
  AddContributor({required this.contributor});
}
class RemoveContributor extends CreateProjectActions{
  final ContributorModel contributor;
  RemoveContributor({required this.contributor});
}

class SearchContributor extends CreateProjectActions{
  final String text;
  SearchContributor({required this.text});
}