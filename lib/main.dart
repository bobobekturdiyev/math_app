import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/routes/router.dart';
import 'core/di/injector.dart';
import 'core/di/locator.dart';

// BACKGROUND HANDLER FOR NOTIFICATION

Future<void> backgroundHandler(RemoteMessage message) async {
  // NotificationService().showNotification(
  //   body: message.data['body'],
  //   title: message.data['title'],
  // );
}

void main() async {
  // HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  // // await NotificationService().initNotification();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  //
  //
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  // locator.registerSingleton<SocketInstanse>(
  //   (SocketInstanse()),
  // );

  runApp(
    Injector(child: MyApp()),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
    super.initState();

    // getToken();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = locator<ThemeData>();

    return MaterialApp.router(
      title: 'Matematika kursi',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
