import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mobile_banking/common/util/util.dart';

class FcmUtility {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static void registerNotification() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    String? token = await _messaging.getToken();

    log("tokens : $token");
  }

  static newFirebaseSetup() {
    _messaging.subscribeToTopic('topicMessaging');

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        NotificationUtility.showNotification(
          title: message.data['title'],
          body: message.data['body'],
          payLoad: '',
        );
      },
    );
  }
}
