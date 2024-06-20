import 'package:dartz/dartz.dart';
import 'package:mobile_banking/common/error/failure_response.dart';
import 'package:mobile_banking/core/network/error_handler.dart';
import 'package:mobile_banking/data/datasource/local/example/example_local_data_source.dart';
import 'package:mobile_banking/data/datasource/remote/example/example_remote_data_source.dart';
import 'package:mobile_banking/data/model/example/request/example_request_model.dart';
import 'package:mobile_banking/data/model/example/response/example_response_model.dart';
import 'package:mobile_banking/domain/repositories/example_repository.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleRemoteDataSources exampleRemoteDataSources;
  final ExampleLocalDataSources exampleLocalDataSources;

  ExampleRepositoryImpl({
    required this.exampleRemoteDataSources,
    required this.exampleLocalDataSources,
  });

  @override
  Future<Either<FailureResponse, ExampleModelResponse>>
      exampleLocalDataSource() async {
    try {
      final response = await exampleLocalDataSources.example();
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<FailureResponse, ExampleModelResponse>> exampleRemoteDataSource(
      {required ExampleModelRequest request}) async {
    try {
      final response = await exampleRemoteDataSources.example(
        request: request,
      );
      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
