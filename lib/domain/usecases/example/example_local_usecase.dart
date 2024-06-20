import 'package:dartz/dartz.dart';
import 'package:mobile_banking/common/error/failure_response.dart';
import 'package:mobile_banking/common/usecase/usecase.dart';
import 'package:mobile_banking/data/model/example/response/example_response_model.dart';
import 'package:mobile_banking/domain/repositories/example_repository.dart';

class ExampleLocalUseCase extends UseCase<ExampleModelResponse, NoParams> {
  final ExampleRepository exampleRepository;

  ExampleLocalUseCase({
    required this.exampleRepository,
  });

  @override
  Future<Either<FailureResponse, ExampleModelResponse>> call(
    NoParams params,
  ) async =>
      await exampleRepository.exampleLocalDataSource();
}
