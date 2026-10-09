import 'package:injectable/injectable.dart';
import '../../../../../core/base/base_cubit.dart';
import 'contract.dart';

@injectable
class RegisterCubit extends BaseCubit<RegisterStates, RegisterActions, RegisterNavigations>
{
  RegisterCubit() : super(RegisterStates());

  @override
  Future<void> doAction(RegisterActions action) async{
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

    emit(state.copyWith(skills: (state.skills??[])..add(skill)));
  }

  void _removeFromSkills(String skill) {
    emit(state.copyWith(skills: (state.skills??[])..remove(skill)));
  }

}