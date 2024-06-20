import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile_banking/common/di/common_dependency.dart';
import 'package:mobile_banking/common/navigation/router/app_router.dart';
import 'package:mobile_banking/core/di/core_dependecies.dart';
import 'package:mobile_banking/data/datasource/local/example/example_local_data_source.dart';
import 'package:mobile_banking/data/datasource/remote/example/example_remote_data_source.dart';
import 'package:mobile_banking/data/model/global/global_model.dart';
import 'package:mobile_banking/data/repository/example_repository_impl.dart';
import 'package:mobile_banking/domain/repositories/example_repository.dart';
import 'package:mobile_banking/domain/usecases/example/example_local_usecase.dart';
import 'package:mobile_banking/domain/usecases/example/example_remote_usecase.dart';
import 'package:mobile_banking/feature/example/presentation/cubit/example_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cubit_injection.dart';
part 'data_source_injection.dart';
part 'repository_injection.dart';
part 'usecase_injection.dart';

final sl = GetIt.instance;

class Injections {
  Future<void> initialize() async {
    await _registerSharedDependencies();
    CubitInjections();
    UseCaseInjections();
    DataSourceInjections();
    RepositoryInjections();
    _setupLocator();
  }

  Future<void> _registerSharedDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    CommonDependencies();
    CoreDependencies();
  }

  void _setupLocator() {
    sl.registerLazySingleton(
      () => AppRouter(),
    );
    sl.registerLazySingleton(
      () => InternetConnectionChecker(),
    );
    sl.registerLazySingleton(
      () => Global(),
    );
  }
}
