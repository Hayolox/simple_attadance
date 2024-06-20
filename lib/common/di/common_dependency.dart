import 'package:get_it/get_it.dart';
import 'package:mobile_banking/common/navigation/navigation.dart';

final sl = GetIt.instance;

class CommonDependencies {
  CommonDependencies() {
    _navigation();
    _routers();
  }

  void _navigation() => sl.registerLazySingleton<NavigationHelper>(
        () => NavigationHelperImpl(),
      );

  void _routers() {}
}
