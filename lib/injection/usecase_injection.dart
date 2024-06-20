part of 'dependency_injection.dart';

class UseCaseInjections {
  UseCaseInjections() {
    _registerUseCases();
  }

  void _registerUseCases() {
    // example code for register usecase to get_it [dependecy injection]
    sl.registerLazySingleton(
      () => ExampleLocalUseCase(
        exampleRepository: sl(),
      ),
    );
    sl.registerLazySingleton(
      () => ExampleRemoteUseCase(
        exampleRepository: sl(),
      ),
    );
  }
}
