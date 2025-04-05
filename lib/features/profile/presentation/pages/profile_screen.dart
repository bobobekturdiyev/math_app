import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/util/helpers.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_sheet.dart';
import 'package:math_app/features/auth/presentation/pages/login_screen.dart';
import 'package:math_app/features/main/presentation/manager/app_bloc.dart';
import 'package:math_app/features/profile/presentation/widgets/w_link_item.dart';
import 'package:math_app/features/profile/presentation/widgets/w_settings_item.dart';

import '../../../../core/resources/app_colors.dart';

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
      // appBar: AppBar(
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   backgroundColor: AppColors.white,
      //   title: Text(
      //     'Sozlamalar',
      //     style: locator<ThemeData>().textTheme.headlineMedium,
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return SliverAppBar(
                expandedHeight: 200,
                pinned: false,
                floating: false,
                backgroundColor: AppColors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(46),
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            AppImages.placeholder,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${locator<AuthBloc>().user?.name} ${locator<AuthBloc>().user?.surname}",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${locator<AuthBloc>().user?.phone}",
                        style: TextStyle(fontSize: 10, color: AppColors.white),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  background: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0),
                    ),
                    child: Image.asset(
                      AppImages.chatBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 16),
                WSettingsItem(
                  text: "Shaxsiy ma'lumotlar",
                  icon: AppIcons.info,
                  onTap: () {
                    context.router.push(ProfileUpdateRoute());
                  },
                ),
                // WSettingsItem(
                //   text: "Tez so'raladigan savollar",
                //   icon: AppIcons.faq,
                //   onTap: () {},
                // ),
                // WSettingsItem(
                //   text: "Maxfiylik siyosati",
                //   icon: AppIcons.privacy,
                //   onTap: () {},
                // ),
                // WSettingsItem(
                //   text: "Foydalanish shartlari",
                //   icon: AppIcons.security,
                //   onTap: () {},
                // ),
                WSettingsItem(
                  text: "Tizimdan chiqish",
                  icon: AppIcons.logout,
                  onTap: _logout,
                  showArrow: false,
                ),
                SizedBox(height: 24),

                BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    if (state is AppLoaded) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          state.appDto.links.length,
                          (index) => WLinkItem(
                            link: state.appDto.links[index],
                          ),
                        ),
                      );
                    }
                    return SizedBox();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _logout() {
    showModalBottomSheet(
      context: context,
      builder: (_) => WSheet(
        children: [
          Text(
            "Haqiqatda ham tizimdan chiqmoqchimisiz?",
            style: locator<ThemeData>().textTheme.headlineMedium,
          ),
          SizedBox(height: 16),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoggedOut) {
                Helper.restart(context);
              }
            },
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: WButton(
                    showLoader: state is LoggingOut,
                    text: 'Tizimdan chiqish',
                    color: AppColors.danger,
                    onTap: () {
                      locator<AuthBloc>().add(Logout());
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: WButton(
              text: 'Bekor qilish',
              color: AppColors.grey,
              textStyle: TextStyle(color: AppColors.black),
              buttonType: ButtonType.outline,
              onTap: () {
                context.router.maybePop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
