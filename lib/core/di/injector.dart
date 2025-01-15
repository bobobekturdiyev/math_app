import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/network/dio_manager.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/features/auth/data/data_sources/auth_service.dart';
import 'package:math_app/features/auth/data/repositories/impl_auth_repo.dart';
import 'package:math_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:math_app/features/chat/presentation/manager/ticket/ticket_bloc.dart';
import 'package:math_app/features/my_courses/data/repositories/impl_my_course_repo.dart';
import 'package:math_app/features/my_courses/domain/repositories/my_course_repo.dart';
import 'package:math_app/features/profile/data/data_source/payme_service/payme_service.dart';
import 'package:math_app/features/profile/data/data_source/profile_service.dart';
import 'package:math_app/features/profile/domain/repositories/profile_repo.dart';

import '../../features/chat/data/data_source/chat_service/chat_service.dart';
import '../../features/chat/data/mapper/chat_mapper.dart';
import '../../features/chat/data/repositories/impl_user_repostories.dart';
import '../../features/chat/domain/repositories/chat_repo.dart';
import '../../features/my_courses/data/data_source/my_course_service.dart';
import '../state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import '../state/bloc/connectivity/connectivity_bloc.dart';
import 'locator.dart';

class Injector extends StatelessWidget {
  final Widget child;

  const Injector({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ..._getAuthRepo(),
        ..._getHomeRepo(),
        ..._getPlanRepo(),
        ..._getMyCourseRepo(),
        ..._getChatRepo(),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<BottomNavBarBloc>(
          create: (_) => locator<BottomNavBarBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => locator<AuthBloc>(),
        ),
        BlocProvider<ConnectivityBloc>(
          create: (_) => locator<ConnectivityBloc>(),
        ),
        BlocProvider<TicketBloc>(
          create: (_) => locator<TicketBloc>(),
        ),
      ], child: child),
    );
  }

  List<RepositoryProvider> _getAuthRepo() => [
        RepositoryProvider<AuthService>(
          create: (context) => AuthService(locator<Dio>()),
        ),
        RepositoryProvider<AuthRepo>(
          create: (context) => ImplAuthRepo(authService: context.read()),
        ),
      ];

  List<RepositoryProvider> _getHomeRepo() => [
        // RepositoryProvider<CourseService>(
        //   create: (context) => CourseService(locator<Dio>()),
        // ),
        // RepositoryProvider<HomeRepo>(
        //   create: (context) =>
        //       ImplHomeRepo(homeService:  context.read()),
        // ),
      ];

  List<RepositoryProvider> _getMyCourseRepo() => [
        RepositoryProvider<MyCourseService>(
          create: (context) => MyCourseService(locator<Dio>()),
        ),
        RepositoryProvider<MyCourseRepo>(
          create: (context) => ImplMyCourseRepo(
            myCourseService: context.read(),
          ),
        ),
      ];

  List<RepositoryProvider> _getPlanRepo() => [
        RepositoryProvider<ProfileService>(
          create: (context) => ProfileService(locator<Dio>()),
        ),
        RepositoryProvider<PaymeService>(
          create: (context) => PaymeService(DioManager.getDio),
        ),
        RepositoryProvider<ProfileRepo>(
          create: (context) => locator<ProfileRepo>(),
        ),
      ];

  List<RepositoryProvider> _getChatRepo() => [
        RepositoryProvider<ChatService>(
          create: (context) => ChatService(locator<Dio>()),
        ),
        RepositoryProvider<ChatMapper>(
          create: (context) => ChatMapper(),
        ),
        RepositoryProvider<ChatRepo>(
          create: (context) => ImplChatRepo(
            authMapper: context.read(),
            authService: context.read(),
          ),
        ),
      ];
}
