part of 'dependency_injection.dart';

class CubitInjections {
  CubitInjections() {
    _registerCubit();
  }

  void _registerCubit() {
    // example code for register cubit to get_it [dependecy injection]
    sl.registerFactory(
      () => ExampleCubit(
        exampleLocalUseCase: sl(),
        exampleRemoteUseCase: sl(),
      ),
    );
  }
}
