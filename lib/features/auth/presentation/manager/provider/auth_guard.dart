// import 'package:auto_route/auto_route.dart';
// import 'package:dla_bz/config/routes/router.gr.dart';
// import 'package:dla_bz/core/resources/app_keys.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) async {
//     String token = await SharedPreferences.getInstance().then((prefs) {
//       return prefs.getString(AppKeys.token) ?? "";
//     });
//
//     if (token == "") {
//       resolver.next(true);
//     } else {
//       resolver.redirect(
//         const AppMainRoute(),
//       );
//     }
//   }
// }
