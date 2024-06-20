import 'package:mobile_banking/common/constant/app_images_constant.dart';

class AppConstants {
  const AppConstants();

  static AppAPI appAPI = const AppAPI();
  static HttpMethodConstant httpMethodConstant = const HttpMethodConstant();
  static DatabaseConstant databaseConstant = const DatabaseConstant();
  static AppImagesConstants appImagesConstants = const AppImagesConstants();
  static AppFeatureCode appFeatureCode = const AppFeatureCode();
  static AppTransferMethod appTransferMethod = const AppTransferMethod();
  static KeyboardType keyboardType = const KeyboardType();

  static const String bankName = "Bank PAC";
  static const String channelId = '6014';
  static const String terminalType = 'MB';
}

class HttpMethodConstant {
  const HttpMethodConstant();

  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
}

class DatabaseConstant {
  const DatabaseConstant();

  String get dbName => 'example.db'; // change this name with real database name
  int get dbVersion => 1;
  String get tExample => 't_example'; // example for name a table
}

class AppAPI {
  const AppAPI();

  // section of example
  String get exampleEndpoint => '/example-endpoint';
}

class AppFeatureCode {
  const AppFeatureCode();
}

class AppTransferMethod {
  const AppTransferMethod();
}

class KeyboardType {
  const KeyboardType();

  String get alfanumeric => 'ALFANUM_TEXTFIELD';
  String get freetext => 'FREE_TEXTFIELD';
  String get numeric => 'NUM_TEXTFIELD';
  String get numeric2 => 'NUMERICTEXTFIELD';
}

class ResponseCodes {
  const ResponseCodes();
  static const String internalServerError = '99';
  static const String dataNotFound = '80';
  static const String succes = '00';
  static const String softTokenNotActive = '7G';
  static const String userDeviceNotFound = '71';
  static const String sessionExpired = 'SE';
}
