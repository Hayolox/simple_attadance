import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_banking/core/network/call_api_service.dart';
import 'package:mobile_banking/core/network/dio_handler.dart';
import 'package:mobile_banking/core/network/navigator_services.dart';
import 'package:mobile_banking/core/network/network_info.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

class CoreDependencies {
  CoreDependencies() {
    _registerCore();
  }

  void _registerCore() {
    sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    sl.registerLazySingleton<DioHandler>(
      () => DioHandler(apiBaseURL: dotenv.env['BASE_URL'].toString()),
    );

    sl.registerLazySingleton(() => ApiHelper());

    sl.registerLazySingleton(() => NavigationService());

    sl.registerLazySingleton(() => CallApiService());

    sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()),
    );
  }
}
