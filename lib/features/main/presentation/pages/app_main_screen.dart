import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:math_app/core/state/bloc/connectivity/connectivity_bloc.dart';
import 'package:math_app/core/util/helpers.dart';
import 'package:math_app/core/widgets/w_bottom_bar_item.dart';

import '../../../../core/di/locator.dart';

@RoutePage()
class AppMainScreen extends StatefulWidget {
  const AppMainScreen({Key? key}) : super(key: key);

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  @override
  void initState() {
    super.initState();
    locator<ConnectivityBloc>().add(CheckConnection());
    init();
  }

  init() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFFFFF), // background color
        statusBarIconBrightness: Brightness.dark, // items color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoggedOut) {
              Helper.restart(context);
            }
          },
        ),
        BlocListener<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            if (state is OfflineState) {
              context.router.replaceAll([NoInternetRoute()]);
            }
          },
        ),
      ],
      child: AutoTabsRouter(
        routes: locator<BottomNavBarBloc>().getRoutes(),
        transitionBuilder: (context, child, animation) {
          return child;
        },
        builder: (context, child) {
          final TabsRouter tabsRouter = AutoTabsRouter.of(context);
          return Container(
            color: AppColors.white,
            child: SafeArea(
              child: BlocListener<BottomNavBarBloc, BottomNavBarState>(
                listener: (context, state) async {
                  if (state is ChangePageIndex && !state.sameRoute) {
                    tabsRouter.setActiveIndex(state.index);
                  }
                },
                child: Scaffold(
                  backgroundColor: AppColors.white,
                  resizeToAvoidBottomInset: true,
                  key: locator<GlobalKey<ScaffoldState>>(),
                  body: child,
                  bottomNavigationBar: Container(
                    constraints: const BoxConstraints(maxHeight: 50),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: AppColors.grey.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                    child: BlocListener<BottomNavBarBloc, BottomNavBarState>(
                      listener: (context, state) async {
                        if (state is ChangePageIndex) {
                          tabsRouter.setActiveIndex(state.index);
                        }
                      },
                      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
                        builder: (context, state) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                WBottomBarItem(
                                  icon: state.index == 0
                                      ? AppIcons.homeEn
                                      : AppIcons.homeDis,
                                  onTap: () => _openPage(RoutePath.home),
                                ),
                                WBottomBarItem(
                                  icon: state.index == 1
                                      ? AppIcons.playRoundEn
                                      : AppIcons.playRoundDis,
                                  onTap: () => _openPage(RoutePath.myCourse),
                                ),
                                WBottomBarItem(
                                  icon: state.index == 2
                                      ? AppIcons.chatEn
                                      : AppIcons.chatDis,
                                  onTap: () => _openPage(RoutePath.chat),
                                ),
                                WBottomBarItem(
                                  icon: state.index == 3
                                      ? AppIcons.profileEn
                                      : AppIcons.profileDis,
                                  onTap: () => _openPage(RoutePath.profile),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _openPage(String path) {
    locator<BottomNavBarBloc>().add(OpenPage(path: path));
    context.router.maybePop();
  }
}
