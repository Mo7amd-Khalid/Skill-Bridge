class RegisterStates{
  final bool isObscured;
  final String? password;
  List<String>? skills;

  RegisterStates({this.isObscured = true, this.password, this.skills = const []});
  RegisterStates copyWith({bool? isObscured, String? password, List<String>? skills}) {
    return RegisterStates(
      isObscured: isObscured ?? this.isObscured,
      password: password ?? this.password,
      skills: skills ?? this.skills,
    );
  }
}

sealed class RegisterActions{}
class ChangeObscured extends RegisterActions{}
class ChangePasswordValue extends RegisterActions{
  final String value;
  ChangePasswordValue(this.value);
}
class GoToLoginScreen extends RegisterActions{}
class AddToSkills extends RegisterActions{
  final String skill;
  AddToSkills(this.skill);
}
class RemoveFromSkills extends RegisterActions{
  final String skill;
  RemoveFromSkills(this.skill);
}


sealed class RegisterNavigations{}
class NavigateToLoginScreen extends RegisterNavigations{}
