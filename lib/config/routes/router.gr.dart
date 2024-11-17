// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;
import 'package:math_app/features/auth/presentation/pages/forgot_password_screen.dart'
    as _i8;
import 'package:math_app/features/auth/presentation/pages/login_screen.dart'
    as _i10;
import 'package:math_app/features/auth/presentation/pages/register/register_screen.dart'
    as _i16;
import 'package:math_app/features/chat/presentation/pages/chat_list_screen.dart'
    as _i3;
import 'package:math_app/features/chat/presentation/pages/chat_screen.dart'
    as _i4;
import 'package:math_app/features/home/presentation/pages/course_details_screen.dart'
    as _i5;
import 'package:math_app/features/home/presentation/pages/home_screen.dart'
    as _i9;
import 'package:math_app/features/main/presentation/pages/app_main_screen.dart'
    as _i1;
import 'package:math_app/features/main/presentation/pages/root/root_chat.dart'
    as _i17;
import 'package:math_app/features/main/presentation/pages/root/root_home.dart'
    as _i18;
import 'package:math_app/features/main/presentation/pages/root/root_matters.dart'
    as _i19;
import 'package:math_app/features/main/presentation/pages/root/root_my_course.dart'
    as _i20;
import 'package:math_app/features/main/presentation/pages/root/root_profile.dart'
    as _i21;
import 'package:math_app/features/my_courses/presentation/pages/my_course_screen.dart'
    as _i11;
import 'package:math_app/features/notification/presentation/pages/notification_screen.dart'
    as _i13;
import 'package:math_app/features/profile/presentation/pages/change_password_screen.dart'
    as _i2;
import 'package:math_app/features/profile/presentation/pages/faq_screen.dart'
    as _i7;
import 'package:math_app/features/profile/presentation/pages/personal_info_screen.dart'
    as _i14;
import 'package:math_app/features/profile/presentation/pages/privacy_policy_screen.dart'
    as _i15;
import 'package:math_app/features/profile/presentation/pages/profile_screen.dart'
    as _i12;
import 'package:math_app/features/profile/presentation/pages/settings_screen.dart'
    as _i22;
import 'package:math_app/features/show_lesson/presentaion/pages/either_result_screen.dart'
    as _i6;
import 'package:math_app/features/show_lesson/presentaion/pages/show_lesson_screen.dart'
    as _i23;
import 'package:math_app/features/show_lesson/presentaion/pages/test_result_screen.dart'
    as _i24;
import 'package:math_app/features/show_lesson/presentaion/pages/tests_screen.dart'
    as _i25;

abstract class $AppRouter extends _i26.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    AppMainRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppMainScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>(
          orElse: () => const ChangePasswordRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChangePasswordScreen(key: args.key),
      );
    },
    ChatListRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatListScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChatScreen(),
      );
    },
    CourseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailsRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CourseDetailsScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    EitherResultRoute.name: (routeData) {
      final args = routeData.argsAs<EitherResultRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EitherResultScreen(
          key: args.key,
          resultType: args.resultType,
        ),
      );
    },
    FAQRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FAQScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginScreen(),
      );
    },
    MyCoursesRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MyCoursesScreen(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MyProfileScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NotificationScreen(),
      );
    },
    PersonalInfoRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalInfoRouteArgs>(
          orElse: () => const PersonalInfoRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.PersonalInfoScreen(key: args.key),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PrivacyPolicyScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.RegisterScreen(),
      );
    },
    RootChat.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.RootChat(),
      );
    },
    RootHome.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RootHome(),
      );
    },
    RootMatter.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RootMatter(),
      );
    },
    RootMyCourse.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RootMyCourse(),
      );
    },
    RootProfile.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.RootProfile(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SettingsScreen(),
      );
    },
    ShowLessonRoute.name: (routeData) {
      final args = routeData.argsAs<ShowLessonRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.ShowLessonScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    TestResultRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.TestResultScreen(),
      );
    },
    TestsRoute.name: (routeData) {
      final args = routeData.argsAs<TestsRouteArgs>(
          orElse: () => const TestsRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.TestsScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AppMainScreen]
class AppMainRoute extends _i26.PageRouteInfo<void> {
  const AppMainRoute({List<_i26.PageRouteInfo>? children})
      : super(
          AppMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppMainRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ChangePasswordScreen]
class ChangePasswordRoute extends _i26.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i26.PageInfo<ChangePasswordRouteArgs> page =
      _i26.PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ChatListScreen]
class ChatListRoute extends _i26.PageRouteInfo<void> {
  const ChatListRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ChatListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatListRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatScreen]
class ChatRoute extends _i26.PageRouteInfo<void> {
  const ChatRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CourseDetailsScreen]
class CourseDetailsRoute extends _i26.PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    _i27.Key? key,
    required String slug,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          CourseDetailsRoute.name,
          args: CourseDetailsRouteArgs(
            key: key,
            slug: slug,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseDetailsRoute';

  static const _i26.PageInfo<CourseDetailsRouteArgs> page =
      _i26.PageInfo<CourseDetailsRouteArgs>(name);
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({
    this.key,
    required this.slug,
  });

  final _i27.Key? key;

  final String slug;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i6.EitherResultScreen]
class EitherResultRoute extends _i26.PageRouteInfo<EitherResultRouteArgs> {
  EitherResultRoute({
    _i27.Key? key,
    required _i6.ResultType resultType,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          EitherResultRoute.name,
          args: EitherResultRouteArgs(
            key: key,
            resultType: resultType,
          ),
          initialChildren: children,
        );

  static const String name = 'EitherResultRoute';

  static const _i26.PageInfo<EitherResultRouteArgs> page =
      _i26.PageInfo<EitherResultRouteArgs>(name);
}

class EitherResultRouteArgs {
  const EitherResultRouteArgs({
    this.key,
    required this.resultType,
  });

  final _i27.Key? key;

  final _i6.ResultType resultType;

  @override
  String toString() {
    return 'EitherResultRouteArgs{key: $key, resultType: $resultType}';
  }
}

/// generated route for
/// [_i7.FAQScreen]
class FAQRoute extends _i26.PageRouteInfo<void> {
  const FAQRoute({List<_i26.PageRouteInfo>? children})
      : super(
          FAQRoute.name,
          initialChildren: children,
        );

  static const String name = 'FAQRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i26.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i26.PageRouteInfo<void> {
  const LoginRoute({List<_i26.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MyCoursesScreen]
class MyCoursesRoute extends _i26.PageRouteInfo<void> {
  const MyCoursesRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MyCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCoursesRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyProfileScreen]
class MyProfileRoute extends _i26.PageRouteInfo<void> {
  const MyProfileRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NotificationScreen]
class NotificationRoute extends _i26.PageRouteInfo<void> {
  const NotificationRoute({List<_i26.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PersonalInfoScreen]
class PersonalInfoRoute extends _i26.PageRouteInfo<PersonalInfoRouteArgs> {
  PersonalInfoRoute({
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          PersonalInfoRoute.name,
          args: PersonalInfoRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PersonalInfoRoute';

  static const _i26.PageInfo<PersonalInfoRouteArgs> page =
      _i26.PageInfo<PersonalInfoRouteArgs>(name);
}

class PersonalInfoRouteArgs {
  const PersonalInfoRouteArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'PersonalInfoRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.PrivacyPolicyScreen]
class PrivacyPolicyRoute extends _i26.PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<_i26.PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i16.RegisterScreen]
class RegisterRoute extends _i26.PageRouteInfo<void> {
  const RegisterRoute({List<_i26.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i17.RootChat]
class RootChat extends _i26.PageRouteInfo<void> {
  const RootChat({List<_i26.PageRouteInfo>? children})
      : super(
          RootChat.name,
          initialChildren: children,
        );

  static const String name = 'RootChat';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RootHome]
class RootHome extends _i26.PageRouteInfo<void> {
  const RootHome({List<_i26.PageRouteInfo>? children})
      : super(
          RootHome.name,
          initialChildren: children,
        );

  static const String name = 'RootHome';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RootMatter]
class RootMatter extends _i26.PageRouteInfo<void> {
  const RootMatter({List<_i26.PageRouteInfo>? children})
      : super(
          RootMatter.name,
          initialChildren: children,
        );

  static const String name = 'RootMatter';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RootMyCourse]
class RootMyCourse extends _i26.PageRouteInfo<void> {
  const RootMyCourse({List<_i26.PageRouteInfo>? children})
      : super(
          RootMyCourse.name,
          initialChildren: children,
        );

  static const String name = 'RootMyCourse';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i21.RootProfile]
class RootProfile extends _i26.PageRouteInfo<void> {
  const RootProfile({List<_i26.PageRouteInfo>? children})
      : super(
          RootProfile.name,
          initialChildren: children,
        );

  static const String name = 'RootProfile';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SettingsScreen]
class SettingsRoute extends _i26.PageRouteInfo<void> {
  const SettingsRoute({List<_i26.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i23.ShowLessonScreen]
class ShowLessonRoute extends _i26.PageRouteInfo<ShowLessonRouteArgs> {
  ShowLessonRoute({
    _i27.Key? key,
    required String slug,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          ShowLessonRoute.name,
          args: ShowLessonRouteArgs(
            key: key,
            slug: slug,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowLessonRoute';

  static const _i26.PageInfo<ShowLessonRouteArgs> page =
      _i26.PageInfo<ShowLessonRouteArgs>(name);
}

class ShowLessonRouteArgs {
  const ShowLessonRouteArgs({
    this.key,
    required this.slug,
  });

  final _i27.Key? key;

  final String slug;

  @override
  String toString() {
    return 'ShowLessonRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i24.TestResultScreen]
class TestResultRoute extends _i26.PageRouteInfo<void> {
  const TestResultRoute({List<_i26.PageRouteInfo>? children})
      : super(
          TestResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestResultRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i25.TestsScreen]
class TestsRoute extends _i26.PageRouteInfo<TestsRouteArgs> {
  TestsRoute({
    _i27.Key? key,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          TestsRoute.name,
          args: TestsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TestsRoute';

  static const _i26.PageInfo<TestsRouteArgs> page =
      _i26.PageInfo<TestsRouteArgs>(name);
}

class TestsRouteArgs {
  const TestsRouteArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'TestsRouteArgs{key: $key}';
  }
}
