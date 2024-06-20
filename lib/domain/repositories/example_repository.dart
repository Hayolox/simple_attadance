import 'package:dartz/dartz.dart';
import 'package:mobile_banking/common/error/failure_response.dart';
import 'package:mobile_banking/data/model/example/request/example_request_model.dart';
import 'package:mobile_banking/data/model/example/response/example_response_model.dart';

abstract class ExampleRepository {
  Future<Either<FailureResponse, ExampleModelResponse>> exampleRemoteDataSource(
      {required ExampleModelRequest request});
  Future<Either<FailureResponse, ExampleModelResponse>>
      exampleLocalDataSource();
}
