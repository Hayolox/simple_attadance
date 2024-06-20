import 'package:mobile_banking/data/model/example/response/example_response_model.dart';

abstract class ExampleLocalDataSources {
  const ExampleLocalDataSources();

  Future<ExampleModelResponse> example();
}

class ExampleLocalDataSourcesImpl implements ExampleLocalDataSources {
  @override
  Future<ExampleModelResponse> example() async {
    try {
      return ExampleModelResponse();
    } catch (e) {
      rethrow;
    }
  }
}
