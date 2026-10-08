import 'package:skill_bridge/core/const/assets.dart';
import 'package:skill_bridge/core/const/keywords.dart';
import 'package:skill_bridge/features/onboarding/data/models/onboarding_dm.dart';

class OnboardingStates{
  List<OnboardingDm> onboardingList = [
    OnboardingDm(title: AppKeywords.onboardingTitle1, description: AppKeywords.onboardingDescription1, image: AppImages.onboarding1),
    OnboardingDm(title: AppKeywords.onboardingTitle2, description: AppKeywords.onboardingDescription2, image: AppImages.onboarding2),
    OnboardingDm(title: AppKeywords.onboardingTitle3, description: AppKeywords.onboardingDescription3, image: AppImages.onboarding3),
  ];
  int currentIndex;
  OnboardingStates({this.currentIndex = 0});

  OnboardingStates copyWith({
    int? currentIndex,
})
  {
    return OnboardingStates(currentIndex: currentIndex ?? this.currentIndex);
  }
}
sealed class OnboardingActions{}
class ChangePage extends OnboardingActions{
  final int index;
  ChangePage(this.index);
}
class GoToMainLayout extends OnboardingActions{}

sealed class OnboardingNavigation{}
class NavigateToLogin extends OnboardingNavigation{}