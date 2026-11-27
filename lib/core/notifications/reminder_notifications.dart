import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as timezone_data;
import 'package:timezone/timezone.dart' as timezone;

class ReminderNotifications {
  ReminderNotifications._();

  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  static Future<void>? _initializing;

  static Future<void> _initialize() =>
      _initializing ??= _initializePlatform();

  static Future<void> _initializePlatform() async {
    timezone_data.initializeTimeZones();
    final localZone = await FlutterTimezone.getLocalTimezone();
    timezone.setLocalLocation(timezone.getLocation(localZone.identifier));

    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(settings);
  }

  static Future<bool> requestPermission() async {
    await _initialize();
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      return await android.requestNotificationsPermission() ?? true;
    }
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      return await ios.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }
    return false;
  }

  static Future<void> setDailyReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required bool enabled,
  }) async {
    await _initialize();
    if (!enabled) {
      await _plugin.cancel(id);
      return;
    }

    final now = timezone.TZDateTime.now(timezone.local);
    var next = timezone.TZDateTime(
      timezone.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (!next.isAfter(now)) {
      next = next.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      id,
      title,
      body,
      next,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'optilife_reminders',
          'OptiLife reminders',
          channelDescription: 'Daily health and habit reminders',
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> setHydrationReminders(bool enabled) async {
    const times = [(10, 0), (14, 0), (18, 0)];
    for (var i = 0; i < times.length; i++) {
      final (hour, minute) = times[i];
      await setDailyReminder(
        id: 102 + i,
        title: 'Time to hydrate',
        body: 'Take a moment to drink some water.',
        hour: hour,
        minute: minute,
        enabled: enabled,
      );
    }
  }
}
