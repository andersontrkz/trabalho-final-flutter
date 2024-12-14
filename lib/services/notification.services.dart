import 'package:flutter/services.dart';

class NotificationService {
  static const platform = MethodChannel('com.example.myapp/notifications');

  static Future<void> sendNotification(String taskTitle) async {
    try {
      await platform.invokeMethod('sendNotification', {'taskTitle': taskTitle});
    } on PlatformException catch (e) {
      print("Erro ao enviar notificação: ${e.message}");
    }
  }
}
