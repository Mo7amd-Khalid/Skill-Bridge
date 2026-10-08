import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_bridge/core/base/base_cubit.dart';
import 'package:skill_bridge/core/const/sharedPreferencesKeys.dart';
import 'package:skill_bridge/features/onboarding/presentation/cubit/contract.dart';

@injectable
class OnboardingCubit extends BaseCubit<OnboardingStates, OnboardingActions, OnboardingNavigation>{
  OnboardingCubit(this._preferences) : super(OnboardingStates());

  final SharedPreferences _preferences;

  @override
  Future<void> doAction(OnboardingActions action) async{
    switch(action) {
      case ChangePage():
        _changePage(action.index);
      case GoToMainLayout():
        _goToMainLayout();
    }
  }

  void _changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void _goToMainLayout() async{
    await _preferences.setBool(SharedPreferencesKeys.onboardingKey, true);
    emitNavigation(NavigateToLogin());
  }
  
  
}