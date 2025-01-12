import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/features/auth/presentation/pages/login_screen.dart';
import 'package:math_app/features/profile/presentation/manager/user_bloc/user_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_settings_item.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/widgets/w_button.dart';

@RoutePage()
class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    if (!locator<AuthBloc>().loggedIn) {
      return LoginScreen();
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'Sozlamalar',
          style: locator<ThemeData>().textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            WSettingsItem(
              text: "Shaxsiy ma'lumotlar",
              icon: AppIcons.info,
              onTap: () {},
            ),
            WSettingsItem(
              text: "Tez so'raladigan savollar",
              icon: AppIcons.faq,
              onTap: () {},
            ),
            WSettingsItem(
              text: "Maxfiylik siyosati",
              icon: AppIcons.privacy,
              onTap: () {},
            ),
            WSettingsItem(
              text: "Foydalanish shartlari",
              icon: AppIcons.security,
              onTap: () {},
            ),
            Spacer(),
            WSettingsItem(
              text: "Tizimdan chiqish",
              icon: AppIcons.logout,
              onTap: () {},
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget bodyOld() => BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return Center(
              child: WButton(
                text: 'Kirish',
                onTap: () {
                  context.router.replaceNamed(RoutePath.login);
                },
              ),
            );
          }
        },
      );
//
// _showBottom() {
//   showModalBottomSheet(
//       context: locator<GlobalKey<ScaffoldState>>().currentContext!,
//       builder: (ctx) {
//         return Wrap(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(top: 16, right: 20, left: 20),
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(16),
//                       topLeft: Radius.circular(16))),
//               child: Column(
//                 children: [
//                   Container(
//                     width: 52,
//                     height: 2,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF8A8A93),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   if (context.read<UserBloc>().isLogin) ...{
//                     _bottomItem(AppIcons.dollar, "Mening hisobim", onTap: () {
//                       context.router.pushNamed(RoutePath.costIncome);
//                     }),
//                   },
//                   _bottomItem(AppIcons.grid, "Tariflar", onTap: () {
//                     context.router.pushNamed(RoutePath.plan);
//                   }),
//                   if (context.read<UserBloc>().isLogin) ...{
//                     _bottomItem(AppIcons.lock, "Parolni yangilash",
//                         onTap: () {
//                       context.router.pushNamed(RoutePath.updatePassword);
//                     }),
//                   },
//                   _bottomItem(AppIcons.smile, "Biz haqimizda", onTap: () {
//                     context.router.pushNamed(RoutePath.about);
//                   }),
//                   _bottomItem(AppIcons.alertCircle, "Foydalanish shartlari",
//                       onTap: () {
//                     context.router.pushNamed(RoutePath.termsUse);
//                   }),
//                   if (context.read<UserBloc>().isLogin) ...{
//                     GestureDetector(
//                       onTap: () {
//                         context.read<UserBloc>().add(LogOut());
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SvgPicture.asset(AppIcons.logOut),
//                             const SizedBox(
//                               width: 12,
//                             ),
//                             Text(
//                               "Tizimdan chiqish",
//                               style: Styles.getTextStyle(
//                                   fontSize: 16,
//                                   color: AppColors.danger,
//                                   fontWeight: FontWeight.w500),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   },
//                   const SizedBox(
//                     height: 8,
//                   )
//                 ],
//               ),
//             ),
//           ],
//         );
//       });
// }
//
// Widget _bottomItem(String icon, String title,
//     {required GestureTapCallback onTap}) {
//   return GestureDetector(
//     onTap: () {
//       onTap();
//       context.router.maybePop();
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SvgPicture.asset(icon),
//           const SizedBox(
//             width: 12,
//           ),
//           Text(
//             title,
//             style: Styles.getTextStyle(fontSize: 16, color: AppColors.text),
//           )
//         ],
//       ),
//     ),
//   );
// }
}
