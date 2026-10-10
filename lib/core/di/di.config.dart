// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/authentication/forget_password/presentation/cubit/cubit.dart'
    as _i649;
import '../../features/authentication/login/presentation/cubit/cubit.dart'
    as _i844;
import '../../features/authentication/register/presentation/cubit/cubit.dart'
    as _i483;
import '../../features/onboarding/presentation/cubit/cubit.dart' as _i1002;
import 'provide_sharedPreferences.dart' as _i1041;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final provideSharedPreferences = _$ProvideSharedPreferences();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => provideSharedPreferences.provideShared(),
      preResolve: true,
    );
    gh.factory<_i649.ForgetPasswordCubit>(() => _i649.ForgetPasswordCubit());
    gh.factory<_i844.LoginCubit>(() => _i844.LoginCubit());
    gh.factory<_i483.RegisterCubit>(() => _i483.RegisterCubit());
    gh.factory<_i1002.OnboardingCubit>(
      () => _i1002.OnboardingCubit(gh<_i460.SharedPreferences>()),
    );
    return this;
  }
}

class _$ProvideSharedPreferences extends _i1041.ProvideSharedPreferences {}
