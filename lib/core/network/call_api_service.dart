import 'package:mobile_banking/core/network/dio_handler.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

class CallApiService {
  CallApiService();

  var apiHelper = sl<ApiHelper>();
}
