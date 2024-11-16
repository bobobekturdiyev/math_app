// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;
import 'package:math_app/features/auth/presentation/pages/forgot_password_screen.dart'
    as _i12;
import 'package:math_app/features/auth/presentation/pages/login_screen.dart'
    as _i15;
import 'package:math_app/features/auth/presentation/pages/register/register_screen.dart'
    as _i20;
import 'package:math_app/features/chat/presentation/pages/chat_list_screen.dart'
    as _i5;
import 'package:math_app/features/chat/presentation/pages/chat_screen.dart'
    as _i6;
import 'package:math_app/features/home/presentation/pages/course_details_screen.dart'
    as _i8;
import 'package:math_app/features/home/presentation/pages/home_screen.dart'
    as _i13;
import 'package:math_app/features/main/presentation/pages/app_main_screen.dart'
    as _i3;
import 'package:math_app/features/main/presentation/pages/root/root_chat.dart'
    as _i21;
import 'package:math_app/features/main/presentation/pages/root/root_home.dart'
    as _i22;
import 'package:math_app/features/main/presentation/pages/root/root_matters.dart'
    as _i23;
import 'package:math_app/features/main/presentation/pages/root/root_my_course.dart'
    as _i24;
import 'package:math_app/features/main/presentation/pages/root/root_profile.dart'
    as _i25;
import 'package:math_app/features/my_courses/presentation/pages/my_course_screen.dart'
    as _i16;
import 'package:math_app/features/notification/presentation/pages/notification_screen.dart'
    as _i18;
import 'package:math_app/features/profile/presentation/pages/about_screen.dart'
    as _i2;
import 'package:math_app/features/profile/presentation/pages/cost_income_screen.dart'
    as _i7;
import 'package:math_app/features/profile/presentation/pages/plan_screen.dart'
    as _i19;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/about_add_screen.dart'
    as _i1;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/award_screen.dart'
    as _i4;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/education_screen.dart'
    as _i9;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/experience_add.dart'
    as _i11;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/language_screen.dart'
    as _i14;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/skils_screen.dart'
    as _i27;
import 'package:math_app/features/profile/presentation/pages/profile_screen.dart'
    as _i17;
import 'package:math_app/features/profile/presentation/pages/term_use_screen.dart'
    as _i28;
import 'package:math_app/features/profile/presentation/pages/update_password_screen.dart'
    as _i31;
import 'package:math_app/features/show_lesson/presentaion/pages/either_result_screen.dart'
    as _i10;
import 'package:math_app/features/show_lesson/presentaion/pages/show_lesson_screen.dart'
    as _i26;
import 'package:math_app/features/show_lesson/presentaion/pages/test_result_screen.dart'
    as _i29;
import 'package:math_app/features/show_lesson/presentaion/pages/tests_screen.dart'
    as _i30;

abstract class $AppRouter extends _i32.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    AboutAddRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutAddScreen(),
      );
    },
    AboutRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AboutScreen(),
      );
    },
    AppMainRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AppMainScreen(),
      );
    },
    AwardRoute.name: (routeData) {
      final args = routeData.argsAs<AwardRouteArgs>(
          orElse: () => const AwardRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.AwardScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ChatListRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChatListScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChatScreen(),
      );
    },
    CostIncomeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CostIncomeScreen(),
      );
    },
    CourseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailsRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CourseDetailsScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    EducationRoute.name: (routeData) {
      final args = routeData.argsAs<EducationRouteArgs>(
          orElse: () => const EducationRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.EducationScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    EitherResultRoute.name: (routeData) {
      final args = routeData.argsAs<EitherResultRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.EitherResultScreen(
          key: args.key,
          resultType: args.resultType,
        ),
      );
    },
    ExperienceRoute.name: (routeData) {
      final args = routeData.argsAs<ExperienceRouteArgs>(
          orElse: () => const ExperienceRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ExperienceScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomeScreen(),
      );
    },
    LanguageEditRoute.name: (routeData) {
      final args = routeData.argsAs<LanguageEditRouteArgs>(
          orElse: () => const LanguageEditRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.LanguageEditScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoginScreen(),
      );
    },
    MyCoursesRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.MyCoursesScreen(),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MyProfileScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.NotificationScreen(),
      );
    },
    PlanRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PlanScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RegisterScreen(),
      );
    },
    RootChat.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.RootChat(),
      );
    },
    RootHome.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.RootHome(),
      );
    },
    RootMatter.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.RootMatter(),
      );
    },
    RootMyCourse.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.RootMyCourse(),
      );
    },
    RootProfile.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.RootProfile(),
      );
    },
    ShowLessonRoute.name: (routeData) {
      final args = routeData.argsAs<ShowLessonRouteArgs>();
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.ShowLessonScreen(
          key: args.key,
          slug: args.slug,
        ),
      );
    },
    SkillsRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.SkillsScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.TermsOfUseScreen(),
      );
    },
    TestResultRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.TestResultScreen(),
      );
    },
    TestsRoute.name: (routeData) {
      final args = routeData.argsAs<TestsRouteArgs>(
          orElse: () => const TestsRouteArgs());
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.TestsScreen(key: args.key),
      );
    },
    UpdatePasswordRoute.name: (routeData) {
      return _i32.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.UpdatePasswordScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutAddScreen]
class AboutAddRoute extends _i32.PageRouteInfo<void> {
  const AboutAddRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AboutAddRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutAddRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AboutScreen]
class AboutRoute extends _i32.PageRouteInfo<void> {
  const AboutRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AppMainScreen]
class AppMainRoute extends _i32.PageRouteInfo<void> {
  const AppMainRoute({List<_i32.PageRouteInfo>? children})
      : super(
          AppMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppMainRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AwardScreen]
class AwardRoute extends _i32.PageRouteInfo<AwardRouteArgs> {
  AwardRoute({
    _i33.Key? key,
    int? id,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          AwardRoute.name,
          args: AwardRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'AwardRoute';

  static const _i32.PageInfo<AwardRouteArgs> page =
      _i32.PageInfo<AwardRouteArgs>(name);
}

class AwardRouteArgs {
  const AwardRouteArgs({
    this.key,
    this.id,
  });

  final _i33.Key? key;

  final int? id;

  @override
  String toString() {
    return 'AwardRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.ChatListScreen]
class ChatListRoute extends _i32.PageRouteInfo<void> {
  const ChatListRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ChatListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatListRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChatScreen]
class ChatRoute extends _i32.PageRouteInfo<void> {
  const ChatRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CostIncomeScreen]
class CostIncomeRoute extends _i32.PageRouteInfo<void> {
  const CostIncomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          CostIncomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CostIncomeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CourseDetailsScreen]
class CourseDetailsRoute extends _i32.PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    _i33.Key? key,
    required String slug,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          CourseDetailsRoute.name,
          args: CourseDetailsRouteArgs(
            key: key,
            slug: slug,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseDetailsRoute';

  static const _i32.PageInfo<CourseDetailsRouteArgs> page =
      _i32.PageInfo<CourseDetailsRouteArgs>(name);
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({
    this.key,
    required this.slug,
  });

  final _i33.Key? key;

  final String slug;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i9.EducationScreen]
class EducationRoute extends _i32.PageRouteInfo<EducationRouteArgs> {
  EducationRoute({
    _i33.Key? key,
    int? id,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          EducationRoute.name,
          args: EducationRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'EducationRoute';

  static const _i32.PageInfo<EducationRouteArgs> page =
      _i32.PageInfo<EducationRouteArgs>(name);
}

class EducationRouteArgs {
  const EducationRouteArgs({
    this.key,
    this.id,
  });

  final _i33.Key? key;

  final int? id;

  @override
  String toString() {
    return 'EducationRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.EitherResultScreen]
class EitherResultRoute extends _i32.PageRouteInfo<EitherResultRouteArgs> {
  EitherResultRoute({
    _i33.Key? key,
    required _i10.ResultType resultType,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          EitherResultRoute.name,
          args: EitherResultRouteArgs(
            key: key,
            resultType: resultType,
          ),
          initialChildren: children,
        );

  static const String name = 'EitherResultRoute';

  static const _i32.PageInfo<EitherResultRouteArgs> page =
      _i32.PageInfo<EitherResultRouteArgs>(name);
}

class EitherResultRouteArgs {
  const EitherResultRouteArgs({
    this.key,
    required this.resultType,
  });

  final _i33.Key? key;

  final _i10.ResultType resultType;

  @override
  String toString() {
    return 'EitherResultRouteArgs{key: $key, resultType: $resultType}';
  }
}

/// generated route for
/// [_i11.ExperienceScreen]
class ExperienceRoute extends _i32.PageRouteInfo<ExperienceRouteArgs> {
  ExperienceRoute({
    _i33.Key? key,
    int? id,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ExperienceRoute.name,
          args: ExperienceRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ExperienceRoute';

  static const _i32.PageInfo<ExperienceRouteArgs> page =
      _i32.PageInfo<ExperienceRouteArgs>(name);
}

class ExperienceRouteArgs {
  const ExperienceRouteArgs({
    this.key,
    this.id,
  });

  final _i33.Key? key;

  final int? id;

  @override
  String toString() {
    return 'ExperienceRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i12.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i32.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i32.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i13.HomeScreen]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute({List<_i32.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i14.LanguageEditScreen]
class LanguageEditRoute extends _i32.PageRouteInfo<LanguageEditRouteArgs> {
  LanguageEditRoute({
    _i33.Key? key,
    int? id,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          LanguageEditRoute.name,
          args: LanguageEditRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'LanguageEditRoute';

  static const _i32.PageInfo<LanguageEditRouteArgs> page =
      _i32.PageInfo<LanguageEditRouteArgs>(name);
}

class LanguageEditRouteArgs {
  const LanguageEditRouteArgs({
    this.key,
    this.id,
  });

  final _i33.Key? key;

  final int? id;

  @override
  String toString() {
    return 'LanguageEditRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i15.LoginScreen]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute({List<_i32.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i16.MyCoursesScreen]
class MyCoursesRoute extends _i32.PageRouteInfo<void> {
  const MyCoursesRoute({List<_i32.PageRouteInfo>? children})
      : super(
          MyCoursesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCoursesRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MyProfileScreen]
class MyProfileRoute extends _i32.PageRouteInfo<void> {
  const MyProfileRoute({List<_i32.PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i18.NotificationScreen]
class NotificationRoute extends _i32.PageRouteInfo<void> {
  const NotificationRoute({List<_i32.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i19.PlanScreen]
class PlanRoute extends _i32.PageRouteInfo<void> {
  const PlanRoute({List<_i32.PageRouteInfo>? children})
      : super(
          PlanRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlanRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RegisterScreen]
class RegisterRoute extends _i32.PageRouteInfo<void> {
  const RegisterRoute({List<_i32.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i21.RootChat]
class RootChat extends _i32.PageRouteInfo<void> {
  const RootChat({List<_i32.PageRouteInfo>? children})
      : super(
          RootChat.name,
          initialChildren: children,
        );

  static const String name = 'RootChat';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i22.RootHome]
class RootHome extends _i32.PageRouteInfo<void> {
  const RootHome({List<_i32.PageRouteInfo>? children})
      : super(
          RootHome.name,
          initialChildren: children,
        );

  static const String name = 'RootHome';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i23.RootMatter]
class RootMatter extends _i32.PageRouteInfo<void> {
  const RootMatter({List<_i32.PageRouteInfo>? children})
      : super(
          RootMatter.name,
          initialChildren: children,
        );

  static const String name = 'RootMatter';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i24.RootMyCourse]
class RootMyCourse extends _i32.PageRouteInfo<void> {
  const RootMyCourse({List<_i32.PageRouteInfo>? children})
      : super(
          RootMyCourse.name,
          initialChildren: children,
        );

  static const String name = 'RootMyCourse';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i25.RootProfile]
class RootProfile extends _i32.PageRouteInfo<void> {
  const RootProfile({List<_i32.PageRouteInfo>? children})
      : super(
          RootProfile.name,
          initialChildren: children,
        );

  static const String name = 'RootProfile';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i26.ShowLessonScreen]
class ShowLessonRoute extends _i32.PageRouteInfo<ShowLessonRouteArgs> {
  ShowLessonRoute({
    _i33.Key? key,
    required String slug,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          ShowLessonRoute.name,
          args: ShowLessonRouteArgs(
            key: key,
            slug: slug,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowLessonRoute';

  static const _i32.PageInfo<ShowLessonRouteArgs> page =
      _i32.PageInfo<ShowLessonRouteArgs>(name);
}

class ShowLessonRouteArgs {
  const ShowLessonRouteArgs({
    this.key,
    required this.slug,
  });

  final _i33.Key? key;

  final String slug;

  @override
  String toString() {
    return 'ShowLessonRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i27.SkillsScreen]
class SkillsRoute extends _i32.PageRouteInfo<void> {
  const SkillsRoute({List<_i32.PageRouteInfo>? children})
      : super(
          SkillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SkillsRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i28.TermsOfUseScreen]
class TermsOfUseRoute extends _i32.PageRouteInfo<void> {
  const TermsOfUseRoute({List<_i32.PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i29.TestResultScreen]
class TestResultRoute extends _i32.PageRouteInfo<void> {
  const TestResultRoute({List<_i32.PageRouteInfo>? children})
      : super(
          TestResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestResultRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}

/// generated route for
/// [_i30.TestsScreen]
class TestsRoute extends _i32.PageRouteInfo<TestsRouteArgs> {
  TestsRoute({
    _i33.Key? key,
    List<_i32.PageRouteInfo>? children,
  }) : super(
          TestsRoute.name,
          args: TestsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'TestsRoute';

  static const _i32.PageInfo<TestsRouteArgs> page =
      _i32.PageInfo<TestsRouteArgs>(name);
}

class TestsRouteArgs {
  const TestsRouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'TestsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i31.UpdatePasswordScreen]
class UpdatePasswordRoute extends _i32.PageRouteInfo<void> {
  const UpdatePasswordRoute({List<_i32.PageRouteInfo>? children})
      : super(
          UpdatePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdatePasswordRoute';

  static const _i32.PageInfo<void> page = _i32.PageInfo<void>(name);
}
