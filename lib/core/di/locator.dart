import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:math_app/config/theme.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:math_app/features/auth/data/data_sources/auth_service.dart';
import 'package:math_app/features/auth/data/repositories/impl_auth_repo.dart';
import 'package:math_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:math_app/features/chat/data/data_source/ticket/ticket_service.dart';
import 'package:math_app/features/chat/data/repositories/impl_ticket_repo.dart';
import 'package:math_app/features/chat/domain/repositories/ticket_repo.dart';
import 'package:math_app/features/chat/presentation/manager/ticket/ticket_bloc.dart';
import 'package:math_app/features/home/data/data_source/course_service.dart';
import 'package:math_app/features/home/data/repositories/impl_course_repo.dart';
import 'package:math_app/features/home/domain/repositories/course_repo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/app_keys.dart';
import '../util/interceptor.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator
      .registerSingleton<GlobalKey<ScaffoldState>>(GlobalKey<ScaffoldState>());

  final prefs = await SharedPreferences.getInstance();

  final token = prefs.getString(AppKeys.token);
  Dio dio = Dio();
  dio.interceptors.addAll([
    CustomInterceptor(),
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
    ),
  ]);

  dio.options.followRedirects = true;
  dio.options.maxRedirects = 5;
  dio.options.contentType = 'application/json';
  dio.options.headers.addAll({
    "X-Authorization": "Programmer Uz",
    "Authorization": "Bearer $token",
    "Accept": "application/json",
  });

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<ThemeData>(AppTheme.light());
  locator.registerSingleton<BottomNavBarBloc>(BottomNavBarBloc());

  locator.registerSingleton<AuthService>(AuthService(locator<Dio>()));
  locator.registerSingleton<AuthRepo>(
      ImplAuthRepo(authService: locator<AuthService>()));
  locator.registerSingleton<AuthBloc>(AuthBloc());

  locator.registerSingleton<CourseService>(CourseService(locator<Dio>()));
  locator.registerSingleton<CourseRepo>(
    ImplCourseRepo(
      courseService: locator<CourseService>(),
    ),
  );

  locator.registerSingleton<TicketService>(TicketService(locator<Dio>()));
  locator.registerSingleton<TicketRepo>(
      ImplTicketRepo(ticketService: locator<TicketService>()));
  locator.registerSingleton<TicketBloc>(TicketBloc());
}
