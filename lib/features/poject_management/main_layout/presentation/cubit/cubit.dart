import 'package:injectable/injectable.dart';
import 'package:skill_bridge/core/base/base_cubit.dart';
import 'package:skill_bridge/features/poject_management/main_layout/presentation/cubit/contract.dart';

@injectable
class MainLayoutCubit extends BaseCubit<MainLayoutStates, MainLayoutActions, MainLayoutNavigations>{
  MainLayoutCubit() : super(MainLayoutStates());

  @override
  Future<void> doAction(MainLayoutActions action) async{
    switch (action) {

      case ChangeCurrentIndex():
        _changeCurrentIndex(action.newIndex);
    }
  }

  void _changeCurrentIndex(int newIndex) {
    emit(state.copyWith(currentIndex: newIndex));
  }
}