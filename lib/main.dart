import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/routes/router.dart';
import 'core/di/injector.dart';
import 'core/di/locator.dart';
import 'features/chat/data/websocket/socket_instance.dart';
import 'firebase_options.dart';
Future<void> backgroundHandler(RemoteMessage message) async {
  // NotificationService().showNotification(
  //   body: message.data['body'],
  //   title: message.data['title'],
  // );
}
void main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService().initNotification();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  locator.registerSingleton<SocketInstanse>(
    (SocketInstanse()),
  );  setupLocator();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('uz', 'UZ'),
        ],
        path: 'assets/translations',
        saveLocale: true,
        startLocale: const Locale('uz', "UZ"),
        child: Injector(child: MyApp())),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.instance.getToken();
  }
  final _router = AppRouter();
@override
  void initState() {
  getToken();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'math_app',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


