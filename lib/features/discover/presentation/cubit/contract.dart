import 'package:skill_bridge/core/utils/resources.dart';

class DiscoverStates{
  final int tab;
  final List<String>? skillsFilters;
  final Resources<List<dynamic>>? searchList;

  DiscoverStates({this.tab = 0, this.skillsFilters, this.searchList = const Resources.initial()});

  DiscoverStates copyWith({int? tab, List<String>? skillsFilters, Resources<List<dynamic>>? searchList}){
    return DiscoverStates(
        skillsFilters: skillsFilters ?? this.skillsFilters,
        tab: tab ?? this.tab,
        searchList: searchList ?? this.searchList
    );
  }
}

sealed class DiscoverAction{}
class ChangeTab extends DiscoverAction{
  int index;
  ChangeTab({required this.index});
}
class Search extends DiscoverAction{
  String? text;
  Search({this.text});
}
class AddOrRemoveElementsToSkillsFilter extends DiscoverAction{
  String skill;
  AddOrRemoveElementsToSkillsFilter({required this.skill});
}
class ClearSkillsFilters extends DiscoverAction{}