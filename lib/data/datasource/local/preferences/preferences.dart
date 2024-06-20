import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? prefs;
  static const String token = "token";
  static const String authorization = "authorization";
  static const String channel = "channel";
  static const String deviceId = "deviceId";
  static const String language = "language";

  static void setStringPref(String key, String value) {
    prefs!.setString(key, value);
  }

  static String getStringPref(String key) {
    return prefs?.getString(key).toString() ?? '';
  }

  Future<String?> getStringAs(String key) async {
    return prefs!.getString(key);
  }

  static void getKey() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void getId(BuildContext context) async {
    String id;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      id = androidInfo.id;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      id = iosInfo.identifierForVendor ?? '';
    }
    Prefs.setDeviceId(id);
  }
}

class PreferencesHelper {
  static Future<bool> getBool(String key) async {
    final p = await prefs;
    return p.getBool(key) ?? false;
  }

  static Future setBool(String key, bool value) async {
    final p = await prefs;
    return p.setBool(key, value);
  }

  static Future<int> getInt(String key) async {
    final p = await prefs;
    return p.getInt(key) ?? 0;
  }

  static Future setInt(String key, int value) async {
    final p = await prefs;
    return p.setInt(key, value);
  }

  static Future<String> getString(String key) async {
    final p = await prefs;
    return p.getString(key) ?? '';
  }

  static Future setString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }

  static Future<double> getDouble(String key) async {
    final p = await prefs;
    return p.getDouble(key) ?? 0.0;
  }

  static Future setDouble(String key, double value) async {
    final p = await prefs;
    return p.setDouble(key, value);
  }

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static void removeAll() async {
    final p = await prefs;

    p.remove(Const.language);
    p.remove(Const.token);
    p.remove(Const.feature);
  }
}

class Prefs {
  static Future setFirstTime(String value) =>
      PreferencesHelper.setString(Const.isFirstTime, value);

  static Future<String> get getFirstTime =>
      PreferencesHelper.getString(Const.isFirstTime);

  static Future setLanguage(String value) =>
      PreferencesHelper.setString(Const.language, value);

  static Future<String> get getLanguage =>
      PreferencesHelper.getString(Const.language);

  static Future setDeviceId(String value) =>
      PreferencesHelper.setString(Const.deviceID, value);

  static Future<String> get getDeviceId =>
      PreferencesHelper.getString(Const.deviceID);

  static Future setToken(String value) =>
      PreferencesHelper.setString(Const.token, value);

  static Future<String> get getToken =>
      PreferencesHelper.getString(Const.token);

  static Future setVersion(String value) =>
      PreferencesHelper.setString(Const.version, value);

  static Future<String> get getVersion =>
      PreferencesHelper.getString(Const.version);

  static Future setLong(String value) =>
      PreferencesHelper.setString(Const.longitude, value);

  static Future<String> get getLong =>
      PreferencesHelper.getString(Const.longitude);

  static Future setLat(String value) =>
      PreferencesHelper.setString(Const.latitude, value);

  static Future<String> get getLat =>
      PreferencesHelper.getString(Const.latitude);

  static Future setFeature(String value) =>
      PreferencesHelper.setString(Const.feature, value);

  static Future<String> get getFeature =>
      PreferencesHelper.getString(Const.feature);

  static Future setLocalFcmToken(String value) =>
      PreferencesHelper.setString(Const.fcmToken, value);

  static Future<String> get getLocalFcmToken =>
      PreferencesHelper.getString(Const.fcmToken);

  static Future setRemoteConfig(String value) =>
      PreferencesHelper.setString(Const.remoteconfig, value);

  static Future<String> get getRemoteConfig =>
      PreferencesHelper.getString(Const.remoteconfig);

  static Future setPrimaryColor(String value) =>
      PreferencesHelper.setString('primaryColor', value);

  static Future<String> get getPrimaryColor =>
      PreferencesHelper.getString('primaryColor');

  static Future setAccentColor(String value) =>
      PreferencesHelper.setString('accentColor', value);

  static Future<String> get getAccentColor =>
      PreferencesHelper.getString('accentColor');

  static Future<String> get getTheme => PreferencesHelper.getString('theme');

  static Future setTheme(String value) =>
      PreferencesHelper.setString('theme', value);

  static Future<void> clear() async {
    await Future.wait(<Future>[
      setLanguage(''),
    ]);
  }

  static Future<void> removeAll() async {
    PreferencesHelper.removeAll();
  }
}

class Const {
  static const String language = 'language';
  static const String token = 'token';
  static const String version = 'version';
  static const String deviceID = 'deviceid';
  static const String feature = 'features';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String fcmToken = 'fcmToken';
  static const String remoteconfig = 'remoteconfig';
  static const String isFirstTime = 'isFirstTime';
}
