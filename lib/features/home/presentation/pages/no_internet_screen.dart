import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_lottie.dart';
import 'package:math_app/core/state/bloc/connectivity/connectivity_bloc.dart';
import 'package:math_app/core/widgets/w_button.dart';

@RoutePage()
class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  void initState() {
    super.initState();
    _retry();
  }

  _retry() {
    locator<ConnectivityBloc>().add(CheckConnection());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, ConnectivityState>(
      listener: (context, state) {
        if (state is OnlineState) {
          context.router.replaceAll([SplashRoute()]);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppLottie.wifi),
              Text(
                "Aloqa uzildi",
              ),
              SizedBox(height: 12),
              WButton(
                text: 'Qayta ulanish',
                onTap: () {
                  _retry();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
