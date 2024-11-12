import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/network/urls.dart';
import '../../../../../core/resources/app_keys.dart';

class DownloadProvider extends ChangeNotifier {
  var _progressList = <double>[];

  // double count = 0.0;

  double currentProgress(int index) {
    //fetch the current progress,
    //its in a list because we might want to download
    // multiple files at the same time,
    // so this makes sure the correct download progress
    // is updated.


    try {
      return _progressList[index];
    } catch (e) {
      _progressList.add(0.0);
      return 0;
    }
  }

  void download(String filePath, int index) async {
    // NotificationService notificationService = NotificationService();
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString(AppKeys.token);
    final storageRef = FirebaseStorage.instance.ref().child(filePath);

    final fileName = storageRef.name;


    final dio = Dio();

    try {
      dio.download("${Urls.baseURl}/export-portfolio", "/storage/emulated/0/Download/$fileName",
          options: Options(
            headers: {
              "X-Authorization":"Programmer Uz",

              "Authorization": "Bearer $token"
            }
          ),
          onReceiveProgress: ((count, total) async {
            await Future.delayed(const Duration(seconds: 1), () {
              // notificationService.createNotification(
              //     100, ((count / total) * 100).toInt(), index);
              notifyListeners();
            });
          }));
    } on DioError catch (e) {
      print("error downloading file $e");
    }
  }
}

// class NotificationService {
//   //Hanle displaying of notifications.
//   static final NotificationService _notificationService =
//   NotificationService._internal();
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   final AndroidInitializationSettings _androidInitializationSettings =
//   const AndroidInitializationSettings('logo');
//
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   NotificationService._internal() {
//     init();
//   }
//
//   void init() async {
//     final InitializationSettings initializationSettings =
//     InitializationSettings(
//       android: _androidInitializationSettings,
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   void createNotification(int count, int i, int id) {
//     //show the notifications.
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//         'progress channel', 'progress channel',
//         channelDescription: 'progress channel description',
//         channelShowBadge: false,
//         importance: Importance.max,
//         priority: Priority.high,
//         onlyAlertOnce: true,
//         showProgress: true,
//         maxProgress: count,
//         progress: i);
//     var platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//     _flutterLocalNotificationsPlugin.show(id, 'Programmer Uz',
//         'yuklab olindi', platformChannelSpecifics,
//         payload: 'item x');
//   }
// }