import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_banking/common/constant/constant.dart';
import 'package:mobile_banking/common/navigation/router/app_route.dart';
import 'package:mobile_banking/core/network/error_handler.dart';
import 'package:mobile_banking/core/network/navigator_services.dart';
import 'package:mobile_banking/data/datasource/local/preferences/preferences.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

class AppInterceptors extends InterceptorsWrapper {
  var navigatorKey = sl<NavigationService>();

  Future<Map<String, dynamic>> _defaultHeader() async {
    var token = await Prefs.getToken;
    var deviceID = await Prefs.getDeviceId;
    var appVersion = await Prefs.getVersion;

    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    headers['Channel'] = AppConstants.channelId;
    headers['Terminal-Type'] = AppConstants.terminalType;
    headers['Device-ID'] = deviceID;
    headers['X-App-Version'] = appVersion;
    headers['Authorization'] = 'Bearer $token';

    return headers;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      options.headers.addAll(await _defaultHeader());

      final requestBody =
          const JsonEncoder.withIndent('  ').convert(options.data);
      final queryParameters =
          const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : ${options.uri}\n'
        '----------------------------------------------------------------------\n'
        'Header: ${options.headers}\n'
        '----------------------------------------------------------------------\n'
        'Request Body: $requestBody\n'
        '----------------------------------------------------------------------\n'
        'Request Query Parameters: $queryParameters\n'
        '----------------------------------------------------------------------\n'
        'Method: ${options.method}\n',
      );

      return handler.next(options);
    } catch (e) {
      final queryParameters =
          const JsonEncoder.withIndent('  ').convert(options.queryParameters);
      log(
        'Request URL : ${options.uri}\n'
        '----------------------------------------------------------------------\n'
        'Header: ${options.headers}\n'
        '----------------------------------------------------------------------\n'
        'Request Body: cannot read request body\n'
        '----------------------------------------------------------------------\n'
        'Request Query Parameters: $queryParameters\n'
        '----------------------------------------------------------------------\n'
        'Method: ${options.method}\n',
      );
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var res = '';
    if (response.data is Map<String, dynamic>) res = checkResult(response.data);
    if (res.isNotEmpty) {
      if (res.contains('Connecting timed out') ||
          response.data['code'] == ResponseCode.sessionExpired) {
        logoutSession(message: response.data['message']);
      }
      final prettyString =
          const JsonEncoder.withIndent('  ').convert(response.data);
      log(
        'Status Code: ${response.statusCode}\n'
        '——————————————————————————————————————————————————————————————————————\n'
        'Response : $prettyString\n',
      );

      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: res,
          response: response,
        ),
      );
    } else {
      final prettyString =
          const JsonEncoder.withIndent('  ').convert(response.data);
      log(
        'Status Code: ${response.statusCode}\n'
        '——————————————————————————————————————————————————————————————————————\n'
        'Response : $prettyString\n',
      );
      return handler.next(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('Dio Exception : $err, ${err.response}');
    return handler.next(err);
  }

  static String checkResult(Map<String, dynamic> response) {
    var result = '';
    String code = response['code'] as String;
    String message = response['message'] as String;
    if (code == 'Connecting timed out') {
      result = '$code-$message';
    } else if (code == ResponseCode.success) {
      result = '';
    } else {
      result = '$message ($code)';
    }

    return result;
  }

  void logoutSession({required String message}) {
    try {
      navigatorKey.navigatorKey.currentState!.pushNamedAndRemoveUntil(
        AppRoutes.login,
        (route) => false,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
