import 'package:firebase_remote_config/firebase_remote_config.dart';

class Global {
  String? deviceId;
  String? version;
  List<int> rawData = [];
  String locale = 'id';
  FirebaseRemoteConfig? remoteConfig;
}
