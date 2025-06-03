// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../presentation/authentication/Data/Data%20Sources/remote/impl/register_remote_data_source_impl.dart'
    as _i175;
import '../../presentation/authentication/Data/Data%20Sources/remote/register_remote_data_source.dart'
    as _i319;
import '../../presentation/authentication/Data/Repository/register_repository_impl.dart'
    as _i1034;
import '../../presentation/authentication/Domain/Repository/register_repository.dart'
    as _i67;
import '../../presentation/authentication/Domain/Use%20Case/register_use_case.dart'
    as _i355;
import '../../presentation/authentication/Features/Cubit/Register/register_view_model.dart'
    as _i75;
import '../api%20manager/api_manager.dart' as _i949;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i949.ApiManager>(() => _i949.ApiManager());
    gh.factory<_i319.RegisterRemoteDataSource>(
      () => _i175.RegisterRemoteDataSourceImpl(
        apiManager: gh<_i949.ApiManager>(),
      ),
    );
    gh.factory<_i67.RegisterRepository>(
      () => _i1034.RegisterRepositoryImpl(
        registerRemoteDataSource: gh<_i319.RegisterRemoteDataSource>(),
      ),
    );
    gh.factory<_i355.RegisterUseCase>(
      () => _i355.RegisterUseCase(
        registerRepository: gh<_i67.RegisterRepository>(),
      ),
    );
    gh.factory<_i75.RegisterViewModel>(
      () =>
          _i75.RegisterViewModel(registerUseCase: gh<_i355.RegisterUseCase>()),
    );
    return this;
  }
}
