// dart format width=80
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
    as _i6;
import 'package:math_app/features/auth/presentation/pages/login_screen.dart'
    as _i9;
import 'package:math_app/features/auth/presentation/pages/register/register_screen.dart'
    as _i15;
import 'package:math_app/features/chat/data/models/ticket/ticket_dto.dart'
    as _i33;
import 'package:math_app/features/chat/presentation/pages/chat_screen.dart'
    as _i3;
import 'package:math_app/features/chat/presentation/pages/ticket_messages_screen.dart'
    as _i25;
import 'package:math_app/features/home/data/model/course/course_dto.dart'
    as _i28;
import 'package:math_app/features/home/data/model/course/lesson_dto.dart'
    as _i30;
import 'package:math_app/features/home/data/model/quiz/quiz_dto.dart' as _i31;
import 'package:math_app/features/home/presentation/pages/course_details_screen.dart'
    as _i4;
import 'package:math_app/features/home/presentation/pages/home_screen.dart'
    as _i7;
import 'package:math_app/features/home/presentation/pages/lesson_screen.dart'
    as _i8;
import 'package:math_app/features/home/presentation/pages/no_internet_screen.dart'
    as _i12;
import 'package:math_app/features/main/presentation/pages/app_main_screen.dart'
    as _i2;
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
import 'package:math_app/features/main/presentation/pages/splash_screen.dart'
    as _i21;
import 'package:math_app/features/my_courses/presentation/pages/my_course_screen.dart'
    as _i10;
import 'package:math_app/features/profile/presentation/pages/about_screen.dart'
    as _i1;
import 'package:math_app/features/profile/presentation/pages/profile_screen.dart'
    as _i11;
import 'package:math_app/features/profile/presentation/pages/profile_update_screen.dart'
    as _i13;
import 'package:math_app/features/profile/presentation/pages/term_use_screen.dart'
    as _i22;
import 'package:math_app/features/quiz/data/models/question_dto.dart' as _i32;
import 'package:math_app/features/quiz/presentation/manager/test/test_bloc.dart'
    as _i29;
import 'package:math_app/features/quiz/presentation/pages/either_result_screen.dart'
    as _i5;
import 'package:math_app/features/quiz/presentation/pages/quiz_screen.dart'
    as _i14;
import 'package:math_app/features/quiz/presentation/pages/test_result_screen.dart'
    as _i23;
import 'package:math_app/features/quiz/presentation/pages/tests_screen.dart'
    as _i24;

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i26.PageRouteInfo<void> {
  const AboutRoute({List<_i26.PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutScreen();
    },
  );
}

/// generated route for
/// [_i2.AppMainScreen]
class AppMainRoute extends _i26.PageRouteInfo<void> {
  const AppMainRoute({List<_i26.PageRouteInfo>? children})
    : super(AppMainRoute.name, initialChildren: children);

  static const String name = 'AppMainRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppMainScreen();
    },
  );
}

/// generated route for
/// [_i3.ChatScreen]
class ChatRoute extends _i26.PageRouteInfo<void> {
  const ChatRoute({List<_i26.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChatScreen();
    },
  );
}

/// generated route for
/// [_i4.CourseDetailsScreen]
class CourseDetailsRoute extends _i26.PageRouteInfo<CourseDetailsRouteArgs> {
  CourseDetailsRoute({
    _i27.Key? key,
    required _i28.CourseDto courseDto,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         CourseDetailsRoute.name,
         args: CourseDetailsRouteArgs(key: key, courseDto: courseDto),
         initialChildren: children,
       );

  static const String name = 'CourseDetailsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CourseDetailsRouteArgs>();
      return _i4.CourseDetailsScreen(key: args.key, courseDto: args.courseDto);
    },
  );
}

class CourseDetailsRouteArgs {
  const CourseDetailsRouteArgs({this.key, required this.courseDto});

  final _i27.Key? key;

  final _i28.CourseDto courseDto;

  @override
  String toString() {
    return 'CourseDetailsRouteArgs{key: $key, courseDto: $courseDto}';
  }
}

/// generated route for
/// [_i5.EitherResultScreen]
class EitherResultRoute extends _i26.PageRouteInfo<EitherResultRouteArgs> {
  EitherResultRoute({
    _i27.Key? key,
    required _i5.ResultType resultType,
    required _i29.QuizResultState quizResultState,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         EitherResultRoute.name,
         args: EitherResultRouteArgs(
           key: key,
           resultType: resultType,
           quizResultState: quizResultState,
         ),
         initialChildren: children,
       );

  static const String name = 'EitherResultRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EitherResultRouteArgs>();
      return _i5.EitherResultScreen(
        key: args.key,
        resultType: args.resultType,
        quizResultState: args.quizResultState,
      );
    },
  );
}

class EitherResultRouteArgs {
  const EitherResultRouteArgs({
    this.key,
    required this.resultType,
    required this.quizResultState,
  });

  final _i27.Key? key;

  final _i5.ResultType resultType;

  final _i29.QuizResultState quizResultState;

  @override
  String toString() {
    return 'EitherResultRouteArgs{key: $key, resultType: $resultType, quizResultState: $quizResultState}';
  }
}

/// generated route for
/// [_i6.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i26.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i26.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i6.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeScreen();
    },
  );
}

/// generated route for
/// [_i8.LessonScreen]
class LessonRoute extends _i26.PageRouteInfo<LessonRouteArgs> {
  LessonRoute({
    _i27.Key? key,
    required _i30.LessonDto lessonDto,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         LessonRoute.name,
         args: LessonRouteArgs(key: key, lessonDto: lessonDto),
         initialChildren: children,
       );

  static const String name = 'LessonRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LessonRouteArgs>();
      return _i8.LessonScreen(key: args.key, lessonDto: args.lessonDto);
    },
  );
}

class LessonRouteArgs {
  const LessonRouteArgs({this.key, required this.lessonDto});

  final _i27.Key? key;

  final _i30.LessonDto lessonDto;

  @override
  String toString() {
    return 'LessonRouteArgs{key: $key, lessonDto: $lessonDto}';
  }
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i26.PageRouteInfo<void> {
  const LoginRoute({List<_i26.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginScreen();
    },
  );
}

/// generated route for
/// [_i10.MyCoursesScreen]
class MyCoursesRoute extends _i26.PageRouteInfo<void> {
  const MyCoursesRoute({List<_i26.PageRouteInfo>? children})
    : super(MyCoursesRoute.name, initialChildren: children);

  static const String name = 'MyCoursesRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i10.MyCoursesScreen();
    },
  );
}

/// generated route for
/// [_i11.MyProfileScreen]
class MyProfileRoute extends _i26.PageRouteInfo<void> {
  const MyProfileRoute({List<_i26.PageRouteInfo>? children})
    : super(MyProfileRoute.name, initialChildren: children);

  static const String name = 'MyProfileRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i11.MyProfileScreen();
    },
  );
}

/// generated route for
/// [_i12.NoInternetScreen]
class NoInternetRoute extends _i26.PageRouteInfo<void> {
  const NoInternetRoute({List<_i26.PageRouteInfo>? children})
    : super(NoInternetRoute.name, initialChildren: children);

  static const String name = 'NoInternetRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i12.NoInternetScreen();
    },
  );
}

/// generated route for
/// [_i13.ProfileUpdateScreen]
class ProfileUpdateRoute extends _i26.PageRouteInfo<void> {
  const ProfileUpdateRoute({List<_i26.PageRouteInfo>? children})
    : super(ProfileUpdateRoute.name, initialChildren: children);

  static const String name = 'ProfileUpdateRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i13.ProfileUpdateScreen();
    },
  );
}

/// generated route for
/// [_i14.QuizScreen]
class QuizRoute extends _i26.PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    _i27.Key? key,
    required _i31.QuizDto quizDto,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         QuizRoute.name,
         args: QuizRouteArgs(key: key, quizDto: quizDto),
         initialChildren: children,
       );

  static const String name = 'QuizRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<QuizRouteArgs>();
      return _i14.QuizScreen(key: args.key, quizDto: args.quizDto);
    },
  );
}

class QuizRouteArgs {
  const QuizRouteArgs({this.key, required this.quizDto});

  final _i27.Key? key;

  final _i31.QuizDto quizDto;

  @override
  String toString() {
    return 'QuizRouteArgs{key: $key, quizDto: $quizDto}';
  }
}

/// generated route for
/// [_i15.RegisterScreen]
class RegisterRoute extends _i26.PageRouteInfo<void> {
  const RegisterRoute({List<_i26.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i15.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i16.RootChat]
class RootChat extends _i26.PageRouteInfo<void> {
  const RootChat({List<_i26.PageRouteInfo>? children})
    : super(RootChat.name, initialChildren: children);

  static const String name = 'RootChat';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i16.RootChat();
    },
  );
}

/// generated route for
/// [_i17.RootHome]
class RootHome extends _i26.PageRouteInfo<void> {
  const RootHome({List<_i26.PageRouteInfo>? children})
    : super(RootHome.name, initialChildren: children);

  static const String name = 'RootHome';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i17.RootHome();
    },
  );
}

/// generated route for
/// [_i18.RootMatter]
class RootMatter extends _i26.PageRouteInfo<void> {
  const RootMatter({List<_i26.PageRouteInfo>? children})
    : super(RootMatter.name, initialChildren: children);

  static const String name = 'RootMatter';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i18.RootMatter();
    },
  );
}

/// generated route for
/// [_i19.RootMyCourse]
class RootMyCourse extends _i26.PageRouteInfo<void> {
  const RootMyCourse({List<_i26.PageRouteInfo>? children})
    : super(RootMyCourse.name, initialChildren: children);

  static const String name = 'RootMyCourse';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i19.RootMyCourse();
    },
  );
}

/// generated route for
/// [_i20.RootProfile]
class RootProfile extends _i26.PageRouteInfo<void> {
  const RootProfile({List<_i26.PageRouteInfo>? children})
    : super(RootProfile.name, initialChildren: children);

  static const String name = 'RootProfile';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i20.RootProfile();
    },
  );
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i26.PageRouteInfo<void> {
  const SplashRoute({List<_i26.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i21.SplashScreen();
    },
  );
}

/// generated route for
/// [_i22.TermsOfUseScreen]
class TermsOfUseRoute extends _i26.PageRouteInfo<void> {
  const TermsOfUseRoute({List<_i26.PageRouteInfo>? children})
    : super(TermsOfUseRoute.name, initialChildren: children);

  static const String name = 'TermsOfUseRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      return const _i22.TermsOfUseScreen();
    },
  );
}

/// generated route for
/// [_i23.TestResultScreen]
class TestResultRoute extends _i26.PageRouteInfo<TestResultRouteArgs> {
  TestResultRoute({
    _i27.Key? key,
    required _i29.QuizResultState quizResultState,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         TestResultRoute.name,
         args: TestResultRouteArgs(key: key, quizResultState: quizResultState),
         initialChildren: children,
       );

  static const String name = 'TestResultRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestResultRouteArgs>();
      return _i23.TestResultScreen(
        key: args.key,
        quizResultState: args.quizResultState,
      );
    },
  );
}

class TestResultRouteArgs {
  const TestResultRouteArgs({this.key, required this.quizResultState});

  final _i27.Key? key;

  final _i29.QuizResultState quizResultState;

  @override
  String toString() {
    return 'TestResultRouteArgs{key: $key, quizResultState: $quizResultState}';
  }
}

/// generated route for
/// [_i24.TestsScreen]
class TestsRoute extends _i26.PageRouteInfo<TestsRouteArgs> {
  TestsRoute({
    _i27.Key? key,
    required List<_i32.QuestionDto> questions,
    required String title,
    required int duration,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         TestsRoute.name,
         args: TestsRouteArgs(
           key: key,
           questions: questions,
           title: title,
           duration: duration,
         ),
         initialChildren: children,
       );

  static const String name = 'TestsRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestsRouteArgs>();
      return _i24.TestsScreen(
        key: args.key,
        questions: args.questions,
        title: args.title,
        duration: args.duration,
      );
    },
  );
}

class TestsRouteArgs {
  const TestsRouteArgs({
    this.key,
    required this.questions,
    required this.title,
    required this.duration,
  });

  final _i27.Key? key;

  final List<_i32.QuestionDto> questions;

  final String title;

  final int duration;

  @override
  String toString() {
    return 'TestsRouteArgs{key: $key, questions: $questions, title: $title, duration: $duration}';
  }
}

/// generated route for
/// [_i25.TicketMessagesScreen]
class TicketMessagesRoute extends _i26.PageRouteInfo<TicketMessagesRouteArgs> {
  TicketMessagesRoute({
    _i27.Key? key,
    required _i33.TicketDto ticketDto,
    List<_i26.PageRouteInfo>? children,
  }) : super(
         TicketMessagesRoute.name,
         args: TicketMessagesRouteArgs(key: key, ticketDto: ticketDto),
         initialChildren: children,
       );

  static const String name = 'TicketMessagesRoute';

  static _i26.PageInfo page = _i26.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TicketMessagesRouteArgs>();
      return _i25.TicketMessagesScreen(
        key: args.key,
        ticketDto: args.ticketDto,
      );
    },
  );
}

class TicketMessagesRouteArgs {
  const TicketMessagesRouteArgs({this.key, required this.ticketDto});

  final _i27.Key? key;

  final _i33.TicketDto ticketDto;

  @override
  String toString() {
    return 'TicketMessagesRouteArgs{key: $key, ticketDto: $ticketDto}';
  }
}
