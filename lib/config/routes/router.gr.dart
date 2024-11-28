// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:math_app/features/auth/presentation/pages/login_screen.dart'
    as _i9;
import 'package:math_app/features/chat/presentation/pages/chat_list_screen.dart'
    as _i3;
import 'package:math_app/features/chat/presentation/pages/chat_screen.dart'
    as _i4;
import 'package:math_app/features/home/presentation/pages/course_details_screen.dart'
    as _i5;
import 'package:math_app/features/home/presentation/pages/home_screen.dart'
    as _i8;
import 'package:math_app/features/main/presentation/pages/app_main_screen.dart'
    as _i1;
import 'package:math_app/features/main/presentation/pages/root/root_chat.dart'
    as _i16;
import 'package:math_app/features/main/presentation/pages/root/root_home.dart'
    as _i17;
import 'package:math_app/features/main/presentation/pages/root/root_matters.dart'
    as _i18;
import 'package:math_app/features/main/presentation/pages/root/root_my_course.dart'
    as _i19;
import 'package:math_app/features/main/presentation/pages/root/root_profile.dart'
    as _i20;
import 'package:math_app/features/my_courses/presentation/pages/my_course_screen.dart'
    as _i10;
import 'package:math_app/features/notification/presentation/pages/notification_screen.dart'
    as _i12;
import 'package:math_app/features/profile/presentation/pages/change_password_screen.dart'
    as _i2;
import 'package:math_app/features/profile/presentation/pages/faq_screen.dart'
    as _i7;
import 'package:math_app/features/profile/presentation/pages/personal_info_screen.dart'
    as _i13;
import 'package:math_app/features/profile/presentation/pages/privacy_policy_screen.dart'
    as _i14;
import 'package:math_app/features/profile/presentation/pages/profile_screen.dart'
    as _i11;
import 'package:math_app/features/profile/presentation/pages/settings_screen.dart'
    as _i21;
import 'package:math_app/features/show_lesson/presentation/pages/either_result_screen.dart'
    as _i6;
import 'package:math_app/features/show_lesson/presentation/pages/quiz_screen.dart'
    as _i15;
import 'package:math_app/features/show_lesson/presentation/pages/show_lesson_screen.dart'
    as _i22;
import 'package:math_app/features/show_lesson/presentation/pages/test_result_screen.dart'
    as _i23;

abstract class $AppRouter extends _i24.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    AppMainRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppMainScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChangePasswordScreen(key: args.key),
      );
    },
    ChatListRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatListScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChatScreen(),
      );
    },
    CourseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailsRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CourseDetailsScreen(
          key: args.key,
          slug: args.slug,
          title: args.title,
        ),
      );
    },
    EitherResultRoute.name: (routeData) {
      final args = routeData.argsAs<EitherResultRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EitherResultScreen(
          key: args.key,
          resultType: args.resultType,
        ),
      );
    },
    FAQRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FAQScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    MyCoursesRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MyCoursesScreen(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyProfileScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.NotificationScreen(),
      );
    },
    PersonalInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalInfoRouteArgs>(
          orElse: () => const PersonalInfoRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.PersonalInfoScreen(key: args.key),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PrivacyPolicyScreen(),
      );
    },
    QuizRoute.name: (routeData) {
      final args = routeData.argsAs<QuizRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.QuizScreen(
          key: args.key,
          quizId: args.quizId,
        ),
      );
    },
    RootChat.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.RootChat(),
      );
    },
    RootHome.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.RootHome(),
      );
    },
    RootMatter.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RootMatter(),
      );
    },
    RootMyCourse.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RootMyCourse(),
      );
    },
    RootProfile.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RootProfile(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SettingsScreen(),
      );
    },
    ShowLessonRoute.name: (routeData) {
      final args = routeData.argsAs<ShowLessonRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.ShowLessonScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    TestResultRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.TestResultScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppMainScreen]
class AppMainRoute extends _i24.PageRouteInfo<void> {
  const AppMainRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AppMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppMainRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChangePasswordScreen]
class ChangePasswordRoute extends _i24.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i24.PageInfo<ChangePasswordRouteArgs> page =
      _i24.PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ChatListScreen]
class ChatListRoute extends _i24.PageRouteInfo<void> {
  const ChatListRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ChatListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatListRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatScreen]
class ChatRoute extends _i24.PageRouteInfo<void> {
  const ChatRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CourseDetailsScreen]
class CourseDetailsRoute extends _i24.PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    _i25.Key? key,
    required String slug,
    required String title,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          CourseDetailsRoute.name,
          args: CourseDetailsRouteArgs(
            key: key,
            slug: slug,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseDetailsRoute';

  static const _i24.PageInfo<CourseDetailsRouteArgs> page =
      _i24.PageInfo<CourseDetailsRouteArgs>(name);
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({
    this.key,
    required this.slug,
    required this.title,
  });

  final _i25.Key? key;

  final String slug;

  final String title;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{key: $key, slug: $slug, title: $title}';
  }
}

/// generated route for
/// [_i6.EitherResultScreen]
class EitherResultRoute extends _i24.PageRouteInfo<EitherResultRouteArgs> {
  EitherResultRoute({
    _i25.Key? key,
    required _i6.ResultType resultType,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          EitherResultRoute.name,
          args: EitherResultRouteArgs(
            key: key,
            resultType: resultType,
          ),
          initialChildren: children,
        );

  static const String name = 'EitherResultRoute';

  static const _i24.PageInfo<EitherResultRouteArgs> page =
      _i24.PageInfo<EitherResultRouteArgs>(name);
}

class EitherResultRouteArgs {
  const EitherResultRouteArgs({
    this.key,
    required this.resultType,
  });

  final _i25.Key? key;

  final _i6.ResultType resultType;

  @override
  String toString() {
    return 'EitherResultRouteArgs{key: $key, resultType: $resultType}';
  }
}

/// generated route for
/// [_i7.FAQScreen]
class FAQRoute extends _i24.PageRouteInfo<void> {
  const FAQRoute({List<_i24.PageRouteInfo>? children})
      : super(
          FAQRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i24.PageRouteInfo<void> {
  const LoginRoute({List<_i24.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MyCoursesScreen]
class MyCoursesRoute extends _i24.PageRouteInfo<void> {
  const MyCoursesRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MyCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCoursesRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyProfileScreen]
class MyProfileRoute extends _i24.PageRouteInfo<void> {
  const MyProfileRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NotificationScreen]
class NotificationRoute extends _i24.PageRouteInfo<void> {
  const NotificationRoute({List<_i24.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PersonalInfoScreen]
class PersonalInfoRoute extends _i24.PageRouteInfo<PersonalInfoRouteArgs> {
  PersonalInfoRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          PersonalInfoRoute.name,
          args: PersonalInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PersonalInfoRoute';

  static const _i24.PageInfo<PersonalInfoRouteArgs> page =
      _i24.PageInfo<PersonalInfoRouteArgs>(name);
}

class PersonalInfoRouteArgs {
  const PersonalInfoRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'PersonalInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i24.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i15.QuizScreen]
class QuizRoute extends _i24.PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    _i25.Key? key,
    required int quizId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          QuizRoute.name,
          args: QuizRouteArgs(
            key: key,
            quizId: quizId,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static const _i24.PageInfo<QuizRouteArgs> page =
      _i24.PageInfo<QuizRouteArgs>(name);
}

class QuizRouteArgs {
  const QuizRouteArgs({
    this.key,
    required this.quizId,
  });

  final _i25.Key? key;

  final int quizId;

  @override
  String toString() {
    return 'QuizRouteArgs{key: $key, quizId: $quizId}';
  }
}

/// generated route for
/// [_i16.RootChat]
class RootChat extends _i24.PageRouteInfo<void> {
  const RootChat({List<_i24.PageRouteInfo>? children})
      : super(
          RootChat.name,
          initialChildren: children,
        );

  static const String name = 'RootChat';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.RootHome]
class RootHome extends _i24.PageRouteInfo<void> {
  const RootHome({List<_i24.PageRouteInfo>? children})
      : super(
          RootHome.name,
          initialChildren: children,
        );

  static const String name = 'RootHome';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RootMatter]
class RootMatter extends _i24.PageRouteInfo<void> {
  const RootMatter({List<_i24.PageRouteInfo>? children})
      : super(
          RootMatter.name,
          initialChildren: children,
        );

  static const String name = 'RootMatter';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RootMyCourse]
class RootMyCourse extends _i24.PageRouteInfo<void> {
  const RootMyCourse({List<_i24.PageRouteInfo>? children})
      : super(
          RootMyCourse.name,
          initialChildren: children,
        );

  static const String name = 'RootMyCourse';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RootProfile]
class RootProfile extends _i24.PageRouteInfo<void> {
  const RootProfile({List<_i24.PageRouteInfo>? children})
      : super(
          RootProfile.name,
          initialChildren: children,
        );

  static const String name = 'RootProfile';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SettingsScreen]
class SettingsRoute extends _i24.PageRouteInfo<void> {
  const SettingsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ShowLessonScreen]
class ShowLessonRoute extends _i24.PageRouteInfo<ShowLessonRouteArgs> {
  ShowLessonRoute({
    _i25.Key? key,
    required String slug,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ShowLessonRoute.name,
          args: ShowLessonRouteArgs(
            key: key,
            slug: slug,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowLessonRoute';

  static const _i24.PageInfo<ShowLessonRouteArgs> page =
      _i24.PageInfo<ShowLessonRouteArgs>(name);
}

class ShowLessonRouteArgs {
  const ShowLessonRouteArgs({
    this.key,
    required this.slug,
  });

  final _i25.Key? key;

  final String slug;

  @override
  String toString() {
    return 'ShowLessonRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i23.TestResultScreen]
class TestResultRoute extends _i24.PageRouteInfo<void> {
  const TestResultRoute({List<_i24.PageRouteInfo>? children})
      : super(
          TestResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestResultRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
