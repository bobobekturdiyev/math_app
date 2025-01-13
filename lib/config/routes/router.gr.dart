// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:flutter/material.dart' as _i34;
import 'package:math_app/features/auth/presentation/pages/forgot_password_screen.dart'
    as _i11;
import 'package:math_app/features/auth/presentation/pages/login_screen.dart'
    as _i15;
import 'package:math_app/features/auth/presentation/pages/register/register_screen.dart'
    as _i19;
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart'
    as _i37;
import 'package:math_app/features/chat/presentation/pages/chat_screen.dart'
    as _i5;
import 'package:math_app/features/chat/presentation/pages/ticket_messages_screen.dart'
    as _i31;
import 'package:math_app/features/home/data/model/course/course_dto.dart'
    as _i35;
import 'package:math_app/features/home/data/model/course/lesson_dto.dart'
    as _i36;
import 'package:math_app/features/home/presentation/pages/course_details_screen.dart'
    as _i7;
import 'package:math_app/features/home/presentation/pages/home_screen.dart'
    as _i12;
import 'package:math_app/features/home/presentation/pages/lesson_screen.dart'
    as _i14;
import 'package:math_app/features/main/presentation/pages/app_main_screen.dart'
    as _i3;
import 'package:math_app/features/main/presentation/pages/root/root_chat.dart'
    as _i20;
import 'package:math_app/features/main/presentation/pages/root/root_home.dart'
    as _i21;
import 'package:math_app/features/main/presentation/pages/root/root_matters.dart'
    as _i22;
import 'package:math_app/features/main/presentation/pages/root/root_my_course.dart'
    as _i23;
import 'package:math_app/features/main/presentation/pages/root/root_profile.dart'
    as _i24;
import 'package:math_app/features/main/presentation/pages/splash_screen.dart'
    as _i27;
import 'package:math_app/features/my_courses/presentation/pages/my_course_screen.dart'
    as _i16;
import 'package:math_app/features/profile/presentation/pages/about_screen.dart'
    as _i2;
import 'package:math_app/features/profile/presentation/pages/cost_income_screen.dart'
    as _i6;
import 'package:math_app/features/profile/presentation/pages/plan_screen.dart'
    as _i18;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/about_add_screen.dart'
    as _i1;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/award_screen.dart'
    as _i4;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/education_screen.dart'
    as _i8;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/experience_add.dart'
    as _i10;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/language_screen.dart'
    as _i13;
import 'package:math_app/features/profile/presentation/pages/portfolio_pages/skils_screen.dart'
    as _i26;
import 'package:math_app/features/profile/presentation/pages/profile_screen.dart'
    as _i17;
import 'package:math_app/features/profile/presentation/pages/term_use_screen.dart'
    as _i28;
import 'package:math_app/features/profile/presentation/pages/update_password_screen.dart'
    as _i32;
import 'package:math_app/features/show_lesson/presentaion/pages/either_result_screen.dart'
    as _i9;
import 'package:math_app/features/show_lesson/presentaion/pages/show_lesson_screen.dart'
    as _i25;
import 'package:math_app/features/show_lesson/presentaion/pages/test_result_screen.dart'
    as _i29;
import 'package:math_app/features/show_lesson/presentaion/pages/tests_screen.dart'
    as _i30;

/// generated route for
/// [_i1.AboutAddScreen]
class AboutAddRoute extends _i33.PageRouteInfo<void> {
  const AboutAddRoute({List<_i33.PageRouteInfo>? children})
    : super(AboutAddRoute.name, initialChildren: children);

  static const String name = 'AboutAddRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutAddScreen();
    },
  );
}

/// generated route for
/// [_i2.AboutScreen]
class AboutRoute extends _i33.PageRouteInfo<void> {
  const AboutRoute({List<_i33.PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i2.AboutScreen();
    },
  );
}

/// generated route for
/// [_i3.AppMainScreen]
class AppMainRoute extends _i33.PageRouteInfo<void> {
  const AppMainRoute({List<_i33.PageRouteInfo>? children})
    : super(AppMainRoute.name, initialChildren: children);

  static const String name = 'AppMainRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i3.AppMainScreen();
    },
  );
}

/// generated route for
/// [_i4.AwardScreen]
class AwardRoute extends _i33.PageRouteInfo<AwardRouteArgs> {
  AwardRoute({_i34.Key? key, int? id, List<_i33.PageRouteInfo>? children})
    : super(
        AwardRoute.name,
        args: AwardRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'AwardRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AwardRouteArgs>(
        orElse: () => const AwardRouteArgs(),
      );
      return _i4.AwardScreen(key: args.key, id: args.id);
    },
  );
}

class AwardRouteArgs {
  const AwardRouteArgs({this.key, this.id});

  final _i34.Key? key;

  final int? id;

  @override
  String toString() {
    return 'AwardRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i5.ChatScreen]
class ChatRoute extends _i33.PageRouteInfo<void> {
  const ChatRoute({List<_i33.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChatScreen();
    },
  );
}

/// generated route for
/// [_i6.CostIncomeScreen]
class CostIncomeRoute extends _i33.PageRouteInfo<void> {
  const CostIncomeRoute({List<_i33.PageRouteInfo>? children})
    : super(CostIncomeRoute.name, initialChildren: children);

  static const String name = 'CostIncomeRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i6.CostIncomeScreen();
    },
  );
}

/// generated route for
/// [_i7.CourseDetailsScreen]
class CourseDetailsRoute extends _i33.PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    _i34.Key? key,
    required _i35.CourseDto courseDto,
    List<_i33.PageRouteInfo>? children,
  }) : super(
         CourseDetailsRoute.name,
         args: CourseDetailsRouteArgs(key: key, courseDto: courseDto),
         initialChildren: children,
       );

  static const String name = 'CourseDetailsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CourseDetailsRouteArgs>();
      return _i7.CourseDetailsScreen(key: args.key, courseDto: args.courseDto);
    },
  );
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({this.key, required this.courseDto});

  final _i34.Key? key;

  final _i35.CourseDto courseDto;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{key: $key, courseDto: $courseDto}';
  }
}

/// generated route for
/// [_i8.EducationScreen]
class EducationRoute extends _i33.PageRouteInfo<EducationRouteArgs> {
  EducationRoute({_i34.Key? key, int? id, List<_i33.PageRouteInfo>? children})
    : super(
        EducationRoute.name,
        args: EducationRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'EducationRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EducationRouteArgs>(
        orElse: () => const EducationRouteArgs(),
      );
      return _i8.EducationScreen(key: args.key, id: args.id);
    },
  );
}

class EducationRouteArgs {
  const EducationRouteArgs({this.key, this.id});

  final _i34.Key? key;

  final int? id;

  @override
  String toString() {
    return 'EducationRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i9.EitherResultScreen]
class EitherResultRoute extends _i33.PageRouteInfo<EitherResultRouteArgs> {
  EitherResultRoute({
    _i34.Key? key,
    required _i9.ResultType resultType,
    List<_i33.PageRouteInfo>? children,
  }) : super(
         EitherResultRoute.name,
         args: EitherResultRouteArgs(key: key, resultType: resultType),
         initialChildren: children,
       );

  static const String name = 'EitherResultRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EitherResultRouteArgs>();
      return _i9.EitherResultScreen(key: args.key, resultType: args.resultType);
    },
  );
}

class EitherResultRouteArgs {
  const EitherResultRouteArgs({this.key, required this.resultType});

  final _i34.Key? key;

  final _i9.ResultType resultType;

  @override
  String toString() {
    return 'EitherResultRouteArgs{key: $key, resultType: $resultType}';
  }
}

/// generated route for
/// [_i10.ExperienceScreen]
class ExperienceRoute extends _i33.PageRouteInfo<ExperienceRouteArgs> {
  ExperienceRoute({_i34.Key? key, int? id, List<_i33.PageRouteInfo>? children})
    : super(
        ExperienceRoute.name,
        args: ExperienceRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'ExperienceRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExperienceRouteArgs>(
        orElse: () => const ExperienceRouteArgs(),
      );
      return _i10.ExperienceScreen(key: args.key, id: args.id);
    },
  );
}

class ExperienceRouteArgs {
  const ExperienceRouteArgs({this.key, this.id});

  final _i34.Key? key;

  final int? id;

  @override
  String toString() {
    return 'ExperienceRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i11.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i33.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i33.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i11.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i12.HomeScreen]
class HomeRoute extends _i33.PageRouteInfo<void> {
  const HomeRoute({List<_i33.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i12.HomeScreen();
    },
  );
}

/// generated route for
/// [_i13.LanguageEditScreen]
class LanguageEditRoute extends _i33.PageRouteInfo<LanguageEditRouteArgs> {
  LanguageEditRoute({
    _i34.Key? key,
    int? id,
    List<_i33.PageRouteInfo>? children,
  }) : super(
         LanguageEditRoute.name,
         args: LanguageEditRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'LanguageEditRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LanguageEditRouteArgs>(
        orElse: () => const LanguageEditRouteArgs(),
      );
      return _i13.LanguageEditScreen(key: args.key, id: args.id);
    },
  );
}

class LanguageEditRouteArgs {
  const LanguageEditRouteArgs({this.key, this.id});

  final _i34.Key? key;

  final int? id;

  @override
  String toString() {
    return 'LanguageEditRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i14.LessonScreen]
class LessonRoute extends _i33.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({
    _i34.Key? key,
    required _i36.LessonDto lessonDto,
    List<_i33.PageRouteInfo>? children,
  }) : super(
         LessonRoute.name,
         args: LessonRouteArgs(key: key, lessonDto: lessonDto),
         initialChildren: children,
       );

  static const String name = 'LessonRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonRouteArgs>();
      return _i14.LessonScreen(key: args.key, lessonDto: args.lessonDto);
    },
  );
}

class LessonRouteArgs {
  const LessonRouteArgs({this.key, required this.lessonDto});

  final _i34.Key? key;

  final _i36.LessonDto lessonDto;

  @override
  String toString() {
    return 'LessonRouteArgs{key: $key, lessonDto: $lessonDto}';
  }
}

/// generated route for
/// [_i15.LoginScreen]
class LoginRoute extends _i33.PageRouteInfo<void> {
  const LoginRoute({List<_i33.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i15.LoginScreen();
    },
  );
}

/// generated route for
/// [_i16.MyCoursesScreen]
class MyCoursesRoute extends _i33.PageRouteInfo<void> {
  const MyCoursesRoute({List<_i33.PageRouteInfo>? children})
    : super(MyCoursesRoute.name, initialChildren: children);

  static const String name = 'MyCoursesRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i16.MyCoursesScreen();
    },
  );
}

/// generated route for
/// [_i17.MyProfileScreen]
class MyProfileRoute extends _i33.PageRouteInfo<void> {
  const MyProfileRoute({List<_i33.PageRouteInfo>? children})
    : super(MyProfileRoute.name, initialChildren: children);

  static const String name = 'MyProfileRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i17.MyProfileScreen();
    },
  );
}

/// generated route for
/// [_i18.PlanScreen]
class PlanRoute extends _i33.PageRouteInfo<void> {
  const PlanRoute({List<_i33.PageRouteInfo>? children})
    : super(PlanRoute.name, initialChildren: children);

  static const String name = 'PlanRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i18.PlanScreen();
    },
  );
}

/// generated route for
/// [_i19.RegisterScreen]
class RegisterRoute extends _i33.PageRouteInfo<void> {
  const RegisterRoute({List<_i33.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i19.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i20.RootChat]
class RootChat extends _i33.PageRouteInfo<void> {
  const RootChat({List<_i33.PageRouteInfo>? children})
    : super(RootChat.name, initialChildren: children);

  static const String name = 'RootChat';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i20.RootChat();
    },
  );
}

/// generated route for
/// [_i21.RootHome]
class RootHome extends _i33.PageRouteInfo<void> {
  const RootHome({List<_i33.PageRouteInfo>? children})
    : super(RootHome.name, initialChildren: children);

  static const String name = 'RootHome';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i21.RootHome();
    },
  );
}

/// generated route for
/// [_i22.RootMatter]
class RootMatter extends _i33.PageRouteInfo<void> {
  const RootMatter({List<_i33.PageRouteInfo>? children})
    : super(RootMatter.name, initialChildren: children);

  static const String name = 'RootMatter';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i22.RootMatter();
    },
  );
}

/// generated route for
/// [_i23.RootMyCourse]
class RootMyCourse extends _i33.PageRouteInfo<void> {
  const RootMyCourse({List<_i33.PageRouteInfo>? children})
    : super(RootMyCourse.name, initialChildren: children);

  static const String name = 'RootMyCourse';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i23.RootMyCourse();
    },
  );
}

/// generated route for
/// [_i24.RootProfile]
class RootProfile extends _i33.PageRouteInfo<void> {
  const RootProfile({List<_i33.PageRouteInfo>? children})
    : super(RootProfile.name, initialChildren: children);

  static const String name = 'RootProfile';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i24.RootProfile();
    },
  );
}

/// generated route for
/// [_i25.ShowLessonScreen]
class ShowLessonRoute extends _i33.PageRouteInfo<ShowLessonRouteArgs> {
  ShowLessonRoute({
    _i34.Key? key,
    required String slug,
    List<_i33.PageRouteInfo>? children,
  }) : super(
         ShowLessonRoute.name,
         args: ShowLessonRouteArgs(key: key, slug: slug),
         initialChildren: children,
       );

  static const String name = 'ShowLessonRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShowLessonRouteArgs>();
      return _i25.ShowLessonScreen(key: args.key, slug: args.slug);
    },
  );
}

class ShowLessonRouteArgs {
  const ShowLessonRouteArgs({this.key, required this.slug});

  final _i34.Key? key;

  final String slug;

  @override
  String toString() {
    return 'ShowLessonRouteArgs{key: $key, slug: $slug}';
  }
}

/// generated route for
/// [_i26.SkillsScreen]
class SkillsRoute extends _i33.PageRouteInfo<void> {
  const SkillsRoute({List<_i33.PageRouteInfo>? children})
    : super(SkillsRoute.name, initialChildren: children);

  static const String name = 'SkillsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i26.SkillsScreen();
    },
  );
}

/// generated route for
/// [_i27.SplashScreen]
class SplashRoute extends _i33.PageRouteInfo<void> {
  const SplashRoute({List<_i33.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i27.SplashScreen();
    },
  );
}

/// generated route for
/// [_i28.TermsOfUseScreen]
class TermsOfUseRoute extends _i33.PageRouteInfo<void> {
  const TermsOfUseRoute({List<_i33.PageRouteInfo>? children})
    : super(TermsOfUseRoute.name, initialChildren: children);

  static const String name = 'TermsOfUseRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i28.TermsOfUseScreen();
    },
  );
}

/// generated route for
/// [_i29.TestResultScreen]
class TestResultRoute extends _i33.PageRouteInfo<void> {
  const TestResultRoute({List<_i33.PageRouteInfo>? children})
    : super(TestResultRoute.name, initialChildren: children);

  static const String name = 'TestResultRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i29.TestResultScreen();
    },
  );
}

/// generated route for
/// [_i30.TestsScreen]
class TestsRoute extends _i33.PageRouteInfo<TestsRouteArgs> {
  TestsRoute({_i34.Key? key, List<_i33.PageRouteInfo>? children})
    : super(
        TestsRoute.name,
        args: TestsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'TestsRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestsRouteArgs>(
        orElse: () => const TestsRouteArgs(),
      );
      return _i30.TestsScreen(key: args.key);
    },
  );
}

class TestsRouteArgs {
  const TestsRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'TestsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i31.TicketMessagesScreen]
class TicketMessagesRoute extends _i33.PageRouteInfo<TicketMessagesRouteArgs> {
  TicketMessagesRoute({
    _i34.Key? key,
    required _i37.TicketDto ticketDto,
    List<_i33.PageRouteInfo>? children,
  }) : super(
         TicketMessagesRoute.name,
         args: TicketMessagesRouteArgs(key: key, ticketDto: ticketDto),
         initialChildren: children,
       );

  static const String name = 'TicketMessagesRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketMessagesRouteArgs>();
      return _i31.TicketMessagesScreen(
        key: args.key,
        ticketDto: args.ticketDto,
      );
    },
  );
}

class TicketMessagesRouteArgs {
  const TicketMessagesRouteArgs({this.key, required this.ticketDto});

  final _i34.Key? key;

  final _i37.TicketDto ticketDto;

  @override
  String toString() {
    return 'TicketMessagesRouteArgs{key: $key, ticketDto: $ticketDto}';
  }
}

/// generated route for
/// [_i32.UpdatePasswordScreen]
class UpdatePasswordRoute extends _i33.PageRouteInfo<void> {
  const UpdatePasswordRoute({List<_i33.PageRouteInfo>? children})
    : super(UpdatePasswordRoute.name, initialChildren: children);

  static const String name = 'UpdatePasswordRoute';

  static _i33.PageInfo page = _i33.PageInfo(
    name,
    builder: (data) {
      return const _i32.UpdatePasswordScreen();
    },
  );
}
