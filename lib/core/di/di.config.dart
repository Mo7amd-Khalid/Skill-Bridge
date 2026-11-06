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

import '../../features/authentication/presentation/forget_password/cubit/cubit.dart'
    as _i860;
import '../../features/authentication/presentation/login/cubit/cubit.dart'
    as _i916;
import '../../features/authentication/presentation/register/cubit/cubit.dart'
    as _i406;
import '../../features/discover/presentation/cubit/cubit.dart' as _i145;
import '../../features/onboarding/presentation/cubit/cubit.dart' as _i1002;
import '../../features/project_management/presentation/create_project/cubit/cubit.dart'
    as _i126;
import '../../features/project_management/presentation/main_layout/cubit/cubit.dart'
    as _i901;
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
    gh.factory<_i860.ForgetPasswordCubit>(() => _i860.ForgetPasswordCubit());
    gh.factory<_i916.LoginCubit>(() => _i916.LoginCubit());
    gh.factory<_i406.RegisterCubit>(() => _i406.RegisterCubit());
    gh.factory<_i145.DiscoverCubit>(() => _i145.DiscoverCubit());
    gh.factory<_i126.CreateProjectCubit>(() => _i126.CreateProjectCubit());
    gh.factory<_i901.MainLayoutCubit>(() => _i901.MainLayoutCubit());
    gh.factory<_i1002.OnboardingCubit>(
      () => _i1002.OnboardingCubit(gh<_i460.SharedPreferences>()),
    );
    return this;
  }
}

class _$ProvideSharedPreferences extends _i1041.ProvideSharedPreferences {}
