import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:math_app/core/widgets/w_non_auth.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.white,
            title: Text(
              'Savol-javob',
              style: locator<ThemeData>().textTheme.headlineMedium,
            ),
          ),
          SliverToBoxAdapter(
            child: WNonAuth(
              text:
                  "Savollar yubora olish uchun, dastlab, tizimga kirishingiz lozim",
              onLoginTap: () {
                locator<BottomNavBarBloc>()
                    .add(OpenPage(path: RoutePath.profile));
              },
            ),
          )
        ],
      ),
    );
  }
}
