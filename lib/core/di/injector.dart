import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/shared/data/data_source/shared_service.dart';
import 'package:math_app/core/shared/data/repositories/impl_shared_repo.dart';
import 'package:math_app/core/shared/domain/repositories/shared_repo.dart';
import 'package:math_app/core/state/bloc/main_data/user_bloc.dart';
import 'package:math_app/features/auth/data/data_sources/auth_service.dart';
import 'package:math_app/features/auth/data/repositories/impl_auth_repo.dart';
import 'package:math_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:math_app/features/home/data/data_source/home_service.dart';
import 'package:math_app/features/home/data/repositories/impl_home_repo.dart';
import 'package:math_app/features/home/domain/repositories/home_repo.dart';
import 'package:math_app/features/my_courses/data/repositories/impl_my_course_repo.dart';
import 'package:math_app/features/my_courses/domain/repositories/my_course_repo.dart';
import 'package:math_app/features/profile/data/data_source/profile_service.dart';
import 'package:math_app/features/profile/data/repositories/impl_profile_repo.dart';
import 'package:math_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:math_app/features/show_lesson/data/data_source/show_lesson_service.dart';
import 'package:math_app/features/show_lesson/data/repositories/impl_show_lesson_repo.dart';
import 'package:math_app/features/show_lesson/domain/repositories/show_lesson_repo.dart';
import '../../features/chat/data/data_source/chat_service/chat_service.dart';
import '../../features/chat/data/mapper/chat_mapper.dart';
import '../../features/chat/data/repositories/impl_user_repostories.dart';
import '../../features/chat/domain/repositories/chat_repo.dart';
import '../../features/chat/domain/usecases/chat_use.dart';
import '../../features/chat/presentation/manager/chat_bloc/chat_bloc.dart';
import '../../features/chat/presentation/manager/chat_manager_bloc/chat_managers_bloc.dart';
import '../../features/my_courses/data/data_source/my_course_service.dart';

import '../state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
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
        ..._getSharedRepo(),
        ..._getHomeRepo(),
        ..._getProfileRepo(),
        ..._getShowLessonRepo(),
        ..._getMyCourseRepo(),
        ..._getChatRepo(),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<BottomNavBarBloc>(
          create: (_) => BottomNavBarBloc(),
        ),
        BlocProvider<UserBloc>(
            create: (ctx) => UserBloc(sharedRepo: ctx.read())),
        BlocProvider(
          create: (context) => ChatManagersBloc(
            ChatUseCases(
              chatRepo: context.read(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ChatBloc(
            ChatUseCases(
              chatRepo: context.read(),
            ),
          ),
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

  List<RepositoryProvider> _getSharedRepo() => [
        RepositoryProvider<SharedService>(
          create: (context) => SharedService(locator<Dio>()),
        ),
        RepositoryProvider<SharedRepo>(
          create: (context) => ImplSharedRepo(sharedService: context.read()),
        ),
      ];

  List<RepositoryProvider> _getHomeRepo() => [
        RepositoryProvider<HomeService>(
          create: (context) => HomeService(locator<Dio>()),
        ),
        RepositoryProvider<HomeRepo>(
          create: (context) => ImplHomeRepo(homeService: context.read()),
        ),
      ];

  List<RepositoryProvider> _getShowLessonRepo() => [
        RepositoryProvider<ShowLessonService>(
          create: (context) => ShowLessonService(locator<Dio>()),
        ),
        RepositoryProvider<ShowLessonRepo>(
          create: (context) => ImplShowLessonRepo(
            service: context.read(),
          ),
        ),
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

  List<RepositoryProvider> _getProfileRepo() => [
        RepositoryProvider<ProfileService>(
          create: (context) => ProfileService(locator<Dio>()),
        ),
        RepositoryProvider<ProfileRepo>(
          create: (context) => ImplProfileRepo(
            profileService: context.read(),
          ),
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
