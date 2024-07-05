import 'package:mobile_banking/core/network/call_api_service.dart';
import 'package:mobile_banking/data/model/example/request/example_request_model.dart';
import 'package:mobile_banking/data/model/example/response/example_response_model.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

abstract class ExampleRemoteDataSources {
  const ExampleRemoteDataSources();
  Future<ExampleModelResponse> example({required ExampleModelRequest request});
}

class ExampleRemoteDataSourcesImpl implements ExampleRemoteDataSources {
  final callService = sl<CallApiService>();

  @override
  Future<ExampleModelResponse> example(
      {required ExampleModelRequest request}) async {
    try {
      /**
     * example code for get data from api service
     */
      //var dataRequest = request.toJson();
      // final response = await callService.connect(
      // AppConstants.appAPI.authenticationSignIn
      // dataRequest
      // HttpMethodConstant.post
      //);
      //return LoginResponse.fromJson(response.data);
      return ExampleModelResponse();
    } catch (e) {
      rethrow;
    }
  }
}
