import 'dart:async';

class ForgetPasswordStates {
  bool? waitForResendAgain;
  int? reminderTime;
  Timer? timer;

  ForgetPasswordStates({this.waitForResendAgain = false, this.reminderTime, this.timer});

  ForgetPasswordStates copyWith({bool? waitForResendAgain, int? reminderTime, Timer? timer})
  {
    return ForgetPasswordStates(
      waitForResendAgain: waitForResendAgain ?? this.waitForResendAgain,
      reminderTime: reminderTime ?? this.reminderTime,
      timer: timer ?? this.timer,
    );
  }
}

sealed class ForgetPasswordActions{}
class WaitForResendLinkMode extends ForgetPasswordActions{}

sealed class ForgetPasswordNavigations{}