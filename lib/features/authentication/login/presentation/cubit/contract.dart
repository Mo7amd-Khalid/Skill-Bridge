class LoginStates{
  bool isObscured;
  bool reminderMe;
  String? password;

  LoginStates({this.isObscured = true, this.password, this.reminderMe = false});
  LoginStates copyWith({bool? isObscured, String? password, bool? reminderMe}) {
    return LoginStates(
      isObscured: isObscured ?? this.isObscured,
      password: password ?? this.password,
      reminderMe: reminderMe ?? this.reminderMe,
    );
  }
}

sealed class LoginActions{}
class ChangeObscured extends LoginActions{}
class ChangeReminderMe extends LoginActions{}
class ChangePasswordValue extends LoginActions{
  final String value;
  ChangePasswordValue(this.value);
}
class GoToRegisterScreen extends LoginActions{}
class GoToHomeScreen extends LoginActions{}
class GoToForgetPasswordScreen extends LoginActions{}

sealed class LoginNavigations{}
class NavigateToHomeScreen extends LoginNavigations{}
class NavigateToRegisterScreen extends LoginNavigations{}
class NavigateToForgetPasswordScreen extends LoginNavigations{}