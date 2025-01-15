import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:math_app/core/state/bloc/connectivity/connectivity_bloc.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/core/widgets/w_logo.dart';

import '../../../../config/routes/router.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    locator<AuthBloc>().add(CheckToken());
    locator<ConnectivityBloc>().add(CheckConnection());
    _startTimer();
  }

  bool isPassed = false;

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      // Redirect to AppMainRoute
      isPassed = true;

      _redirect(isTimer: true);
    });
  }

  _redirect({bool isTimer = false}) {
    if (isTimer && !statePassed) {
      return;
    }

    locator<BottomNavBarBloc>().add(OpenPage(path: RoutePath.home));
    context.router.replaceAll([AppMainRoute()]);
  }

  bool statePassed = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoggedIn) {
              if (isPassed && !statePassed) {
                _redirect();
              }
              statePassed = true;
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
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WLogo(),
              const SizedBox(height: 16),
              const Text(
                'Matematika kursi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              WLoader(), // Loading indicator
            ],
          ),
        ),
      ),
    );
  }
}
