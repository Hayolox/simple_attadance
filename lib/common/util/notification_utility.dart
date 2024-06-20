import 'dart:developer';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationUtility {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'channel_id',
    'channel_name',
    importance: Importance.max,
  );

  static Future<void> initNotification() async {
    try {
      AndroidInitializationSettings initializationSettingsAndroid =
          const AndroidInitializationSettings('@mipmap/ic_launcher');

      const DarwinInitializationSettings initializationSettingsDarwin =
          DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: null,
      );

      await notificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
      );

      await notificationsPlugin.initialize(
        initializationSettings,
      );
    } catch (e) {
      log("error initNotification $e");
    }
  }

  static NotificationDetails notificationDetails({String? body}) {
    try {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: BigTextStyleInformation(body ?? ''),
      );

      const DarwinNotificationDetails iOSPlatformChannelSpecifics =
          DarwinNotificationDetails();

      return NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
    } catch (e) {
      log("error notificationDetails $e");
      rethrow;
    }
  }

  static requestPermission() async {
    if (Platform.isIOS) {
      final iosImplementation =
          notificationsPlugin.resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>();
      await iosImplementation?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );
    }
  }

  static Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    try {
      return notificationsPlugin.show(
        id,
        title,
        body,
        notificationDetails(body: body),
        payload: payLoad,
      );
    } catch (e) {
      log("error showNotification $e");
      rethrow;
    }
  }
}
