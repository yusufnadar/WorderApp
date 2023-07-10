import 'awesomeNotification/awesome_notification_service.dart';

class NotificationService {
  NotificationService._init();

  static final NotificationService _instance = NotificationService._init();

  static NotificationService get instance => _instance;

  final awesomeNotificationService = AwesomeNotificationService.instance;

  Future<void> init() async {
    await awesomeNotificationService.init();
  }
}
