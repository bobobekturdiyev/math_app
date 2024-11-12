
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('logo');
//
//     var initializationSettingsIOS = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification:
//             (int id, String? title, String? body, String? payload) async {});
//
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }
//
//   notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max,
//             sound: RawResourceAndroidNotificationSound('music')),
//         iOS: DarwinNotificationDetails(sound: 'music.mp3'));
//   }
//
//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return notificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }
// }

// import 'dart:async';

// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:programmeruz_chat/domain/entities/messages/message.dart';
// import 'package:programmeruz_chat/presentation/ui/resources/socket_instance.dart';
// import 'package:programmeruz_chat/presentation/ui/resources/websocket.dart';

// void connect() {
//   SocketInstanse socketInstanse = SocketInstanse();
//   socketInstanse.socket.getStream().listen((event) {
//     doEvent(event);
//   });
// }

// doEvent(String event) {
//   final eventName = CustomWebsocket.getEvent(event);
//   switch (eventName) {
//     case 'App\\Events\\MessageSent':
//       {
//         MessageType message =
//             MessageType.fromJson(CustomWebsocket.getJson(event)['message']);

//         print("<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>");

//         print(
//           message.text,
//         );
//         print("<<<<<<<<<<<<<<<<<object>>>>>>>>>>>>>>>>>");
//       }
//   }
// }

// void onStart(ServiceInstance service) async {
//   connect();
  
//   NotificationService()
//       .showNotification(title: 'Sample title', body: 'It works!');
// }

// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   final service = FlutterBackgroundService();
//   AndroidNotificationChannel channel = const AndroidNotificationChannel(
//     "programmer uz",
//     "foregrounf service",
//     importance: Importance.high,
//   );

//   sendMessage() async {
//     await service.configure(
//         iosConfiguration: IosConfiguration(),
//         androidConfiguration: AndroidConfiguration(
//           onStart: onStart,
//           isForegroundMode: true,
//           autoStart: true,
//           foregroundServiceNotificationId: 888,
//         ));
//     service.startService();
//   }

//   Future<void> initNotification() async {
//     await notificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('logo');

//     var initializationSettingsIOS = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification:
//             (int id, String? title, String? body, String? payload) async {});

//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }

//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return await notificationsPlugin.show(
//       id,
//       title,
//       body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails(),
//       ),
//     );
//   }
// }
