import 'package:injectable/injectable.dart';
import 'package:skill_bridge/core/base/base_cubit.dart';
import 'package:skill_bridge/features/authentication/login/presentation/cubit/contract.dart';


@injectable
class LoginCubit extends BaseCubit<LoginStates, LoginActions, LoginNavigations>
{
  LoginCubit() : super(LoginStates());

  @override
  Future<void> doAction(LoginActions action) async{
    switch (action) {
      case ChangeObscured():
        _changeObscured();
      case ChangePasswordValue():
        _changePasswordValue(action.value);
      case ChangeReminderMe():
        _changeReminderMe();
      case GoToRegisterScreen():
        _goToRegisterScreen();
      case GoToHomeScreen():
        _goToHomeScreen();
      case GoToForgetPasswordScreen():
        _goToForgetPasswordScreen();
    }
  }

  void _changeObscured() {
    emit(state.copyWith(isObscured: !state.isObscured));
  }

  void _changePasswordValue(String value) {
    emit(state.copyWith(password: value));
  }

  void _changeReminderMe() {
    emit(state.copyWith(reminderMe: !state.reminderMe));
  }

  void _goToForgetPasswordScreen() {
    emitNavigation(NavigateToForgetPasswordScreen());
  }

  void _goToRegisterScreen() {
    emitNavigation(NavigateToRegisterScreen());
  }

  void _goToHomeScreen() {
    emitNavigation(NavigateToHomeScreen());
  }

}