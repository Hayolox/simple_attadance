part of 'dependency_injection.dart';

class RepositoryInjections {
  RepositoryInjections() {
    _registerRepository();
  }

  void _registerRepository() {
    // example code for register repository to get_it [dependecy injection]
    sl.registerLazySingleton<ExampleRepository>(
      () => ExampleRepositoryImpl(
        exampleLocalDataSources: sl(),
        exampleRemoteDataSources: sl(),
      ),
    );
  }
}
