part of 'dependency_injection.dart';

class DataSourceInjections {
  DataSourceInjections() {
    _registerDataSources();
  }

  void _registerDataSources() {
    // example code for register datasource to get_it [dependecy injection]
    sl.registerLazySingleton<ExampleLocalDataSources>(
      () => ExampleLocalDataSourcesImpl(),
    );

    sl.registerLazySingleton<ExampleRemoteDataSources>(
      () => ExampleRemoteDataSourcesImpl(),
    );
  }
}
