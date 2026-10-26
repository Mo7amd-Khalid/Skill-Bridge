import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:skill_bridge/core/base/base_cubit.dart';

import 'contract.dart';

@injectable
class ForgetPasswordCubit extends BaseCubit<ForgetPasswordStates, ForgetPasswordActions, ForgetPasswordNavigations>{
  ForgetPasswordCubit() : super(ForgetPasswordStates());

  @override
  Future<void> doAction(ForgetPasswordActions action) async{
    switch (action) {

      case WaitForResendLinkMode():
        _waitForResendLinkMode();
    }
  }

  void _waitForResendLinkMode() {
    emit(state.copyWith(waitForResendAgain: true, reminderTime: 120));
    emit(state.copyWith(timer: Timer.periodic(Duration(seconds: 1),(timer){
      if(state.reminderTime! > 0){
        emit(state.copyWith(reminderTime: state.reminderTime! - 1));
      }
      else
      {
        timer.cancel();
        emit(state.copyWith(waitForResendAgain: false));
      }
    })));

  }



}