import 'package:dartz/dartz.dart';
import 'package:mobile_banking/common/error/failure_response.dart';
import 'package:mobile_banking/common/usecase/usecase.dart';
import 'package:mobile_banking/data/model/example/request/example_request_model.dart';
import 'package:mobile_banking/data/model/example/response/example_response_model.dart';
import 'package:mobile_banking/domain/repositories/example_repository.dart';

class ExampleRemoteUseCase
    extends UseCase<ExampleModelResponse, ExampleModelRequest> {
  final ExampleRepository exampleRepository;

  ExampleRemoteUseCase({
    required this.exampleRepository,
  });

  @override
  Future<Either<FailureResponse, ExampleModelResponse>> call(
    ExampleModelRequest params,
  ) async =>
      await exampleRepository.exampleRemoteDataSource(
        request: params,
      );
}
