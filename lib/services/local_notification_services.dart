import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationServices {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    _notificationPlugin.initialize(initializationSettings);
  }
}
