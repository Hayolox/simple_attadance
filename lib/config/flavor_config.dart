enum FlavorType {
  development,
  staging,
}

String getFlavorText(FlavorType flavor) {
  switch (flavor) {
    case FlavorType.development:
      return 'DEV';
    case FlavorType.staging:
      return 'STG';
    default:
      return '';
  }
}

class FlavorValues {
  final String baseURL;

  FlavorValues({required this.baseURL});
}

class FlavorConfig {
  final FlavorType flavor;
  final String appName;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required FlavorType flavor,
    required String appName,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      enumName(flavor.toString()),
    );
    return _instance!;
  }

  FlavorConfig._internal(
    this.flavor,
    this.appName,
  );

  static FlavorConfig get instance {
    return _instance!;
  }

  static String enumName(String enumToString) {
    var paths = enumToString.split('.');
    return paths[paths.length - 1];
  }

  static bool isDevelopment() => _instance?.flavor == FlavorType.development;

  static bool isProduction() => _instance?.flavor == FlavorType.staging;
}
