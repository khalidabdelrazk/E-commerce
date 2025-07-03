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

import '../../presentation/authentication/Data/Data%20Sources/login/impl/login_data_source_impl.dart'
    as _i247;
import '../../presentation/authentication/Data/Data%20Sources/login/login_data_source.dart'
    as _i271;
import '../../presentation/authentication/Data/Data%20Sources/register/impl/register_remote_data_source_impl.dart'
    as _i766;
import '../../presentation/authentication/Data/Data%20Sources/register/register_remote_data_source.dart'
    as _i1004;
import '../../presentation/authentication/Data/Repository/auth_repository_impl.dart'
    as _i659;
import '../../presentation/authentication/Domain/Repository/auth_repository.dart'
    as _i471;
import '../../presentation/authentication/Domain/Use%20Case/login_use_case.dart'
    as _i540;
import '../../presentation/authentication/Domain/Use%20Case/register_use_case.dart'
    as _i355;
import '../../presentation/authentication/Features/Cubit/auth_view_model.dart'
    as _i625;
import '../../presentation/home%20tab/data/data%20source/get_brands/get_brands_data_source.dart'
    as _i415;
import '../../presentation/home%20tab/data/data%20source/get_brands/remote/get_brands_data_source_impl.dart'
    as _i486;
import '../../presentation/home%20tab/data/data%20source/get_categories/get_category_data_source.dart'
    as _i579;
import '../../presentation/home%20tab/data/data%20source/get_categories/remote/get_category_data_source_impl.dart'
    as _i564;
import '../../presentation/home%20tab/data/repository/home_repository_impl.dart'
    as _i1030;
import '../../presentation/home%20tab/domain/repository/home_repository.dart'
    as _i20;
import '../../presentation/home%20tab/domain/usecase/get_brands_use_case.dart'
    as _i203;
import '../../presentation/home%20tab/domain/usecase/get_category_use_case.dart'
    as _i128;
import '../../presentation/home%20tab/ui/cubit/home_view_model.dart' as _i193;
import '../../presentation/product%20tab/data/data%20source/get_all_product_data_source.dart'
    as _i936;
import '../../presentation/product%20tab/data/data%20source/remote/get_all_product_data_source_impl.dart'
    as _i557;
import '../../presentation/product%20tab/data/repository/get_all_product_repository_impl.dart'
    as _i583;
import '../../presentation/product%20tab/domain/repository/get_all_product_repository.dart'
    as _i655;
import '../../presentation/product%20tab/domain/use%20cases/get_all_product_use_case.dart'
    as _i876;
import '../../presentation/product%20tab/feature/cubit/product_tab_view_model.dart'
    as _i214;
import '../api%20manager/api_manager.dart' as _i949;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i949.ApiManager>(() => _i949.ApiManager());
    gh.factory<_i579.GetCategoryDataSource>(
      () => _i564.GetCategoryDataSourceImpl(apiManager: gh<_i949.ApiManager>()),
    );
    gh.factory<_i936.GetALlProductDataSource>(
      () =>
          _i557.GetAllProductDataSourceImpl(apiManager: gh<_i949.ApiManager>()),
    );
    gh.factory<_i1004.RegisterRemoteDataSource>(
      () => _i766.RegisterRemoteDataSourceImpl(
        apiManager: gh<_i949.ApiManager>(),
      ),
    );
    gh.factory<_i415.GetBrandsDataSource>(
      () => _i486.GetBrandsDataSourceImpl(apiManager: gh<_i949.ApiManager>()),
    );
    gh.factory<_i271.LoginDataSource>(
      () => _i247.LoginDataSourceImpl(apiManager: gh<_i949.ApiManager>()),
    );
    gh.factory<_i655.GetAllProductRepository>(
      () => _i583.GetALlProductRepositoryImpl(
        getALlProductDataSource: gh<_i936.GetALlProductDataSource>(),
      ),
    );
    gh.factory<_i20.HomeRepository>(
      () => _i1030.HomeRepositoryImpl(
        getCategoryDataSource: gh<_i579.GetCategoryDataSource>(),
        getBrandsDataSource: gh<_i415.GetBrandsDataSource>(),
      ),
    );
    gh.factory<_i471.AuthRepository>(
      () => _i659.AuthRepositoryImpl(
        gh<_i271.LoginDataSource>(),
        registerRemoteDataSource: gh<_i1004.RegisterRemoteDataSource>(),
      ),
    );
    gh.factory<_i876.GetAllProductUseCase>(
      () => _i876.GetAllProductUseCase(
        getAllProductRepository: gh<_i655.GetAllProductRepository>(),
      ),
    );
    gh.factory<_i214.ProductTabViewModel>(
      () => _i214.ProductTabViewModel(
        getAllProductUseCase: gh<_i876.GetAllProductUseCase>(),
      ),
    );
    gh.factory<_i540.LoginUseCase>(
      () => _i540.LoginUseCase(authRepository: gh<_i471.AuthRepository>()),
    );
    gh.factory<_i355.RegisterUseCase>(
      () =>
          _i355.RegisterUseCase(registerRepository: gh<_i471.AuthRepository>()),
    );
    gh.factory<_i128.GetCategoryUseCase>(
      () => _i128.GetCategoryUseCase(homeRepository: gh<_i20.HomeRepository>()),
    );
    gh.factory<_i203.GetBrandsUseCase>(
      () => _i203.GetBrandsUseCase(homeRepository: gh<_i20.HomeRepository>()),
    );
    gh.factory<_i625.AuthViewModel>(
      () => _i625.AuthViewModel(
        gh<_i540.LoginUseCase>(),
        registerUseCase: gh<_i355.RegisterUseCase>(),
      ),
    );
    gh.factory<_i193.HomeViewModel>(
      () => _i193.HomeViewModel(
        getCategoryUseCase: gh<_i128.GetCategoryUseCase>(),
        getBrandsUseCase: gh<_i203.GetBrandsUseCase>(),
      ),
    );
    return this;
  }
}
