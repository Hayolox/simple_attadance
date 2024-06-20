import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_banking/core/network/api_interceptors.dart';
import 'package:mobile_banking/core/network/handle_certificate_ssl.dart';
import 'package:mobile_banking/data/datasource/local/preferences/preferences.dart';
import 'package:mobile_banking/data/model/global/global_model.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

class DioHandler {
  final String apiBaseURL;

  DioHandler({required this.apiBaseURL});

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseURL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    );

    final dio = Dio(options);
    dio.interceptors.add(AppInterceptors());

    // bypass ssl certificate
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );

    // with ssl certificate
    // dio.httpClientAdapter = IOHttpClientAdapter(
    //   createHttpClient: () {
    //     SecurityContext sc = SecurityContext();
    //     sc.setTrustedCertificatesBytes(raw.data);
    //     HttpClient httpClient = HttpClient(context: sc);
    //     return httpClient;
    //   },
    // );

    return dio;
  }
}

class ApiHelper {
  Dio dio = Dio();

  ApiHelper() {
    dio = Dio();
    dio.options.baseUrl = dotenv.env['BASE_URL'].toString();
    dio.options.connectTimeout = const Duration(seconds: 60);
    dio.options.receiveTimeout = const Duration(seconds: 60);
    dio.options.responseType = ResponseType.json;
    dio.interceptors.add(AppInterceptors());

    // with ssl certificate
    var remoteConf = sl<Global>().remoteConfig;
    if (remoteConf != null) {
      HttpOverrides.global = HandleCertificateSsl();
    } else {
      _bypassSslCertificate();
    }
  }

  _bypassSslCertificate() {
    // bypass ssl certificate
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Response<T>> post<T>(String url, Map<String, dynamic> data) {
    return dio.post(url, data: data);
  }

  Future<Response<T>> postWithHeader<T>(
      String url, dynamic data, Options options) {
    return dio.post(url, data: data, options: options);
  }

  Future<Response<T>> get<T>(String url, Map<String, dynamic> data) {
    return dio.get(url, queryParameters: data);
  }

  requestInterceptor(RequestOptions options) async {
    var token = await Prefs.getDeviceId;
    options.headers.addAll({Preferences.token: token});
    return options;
  }

  responseInterceptor(Response response) {}

  errorInterceptor(DioException error) {}
}
