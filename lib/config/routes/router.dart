import 'package:auto_route/auto_route.dart';
import 'package:math_app/config/routes/router.gr.dart';

import 'route_path.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        //AUTH
        AutoRoute(
          page: LoginRoute.page,
          path: "/login",
          // initial: true
        ),
        AutoRoute(
          page: SplashRoute.page,
          path: "/splash",
          initial: true,
          // initial: true
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: RoutePath.register,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          path: RoutePath.forgotPassword,
        ),

        //================

        AutoRoute(
          page: AppMainRoute.page,
          path: RoutePath.main,
          children: [
            AutoRoute(
              page: RootHome.page,
              path: RoutePath.home,
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  path: "",
                ),
              ],
            ),
            AutoRoute(
              page: RootMyCourse.page,
              path: RoutePath.myCourse,
              children: [
                AutoRoute(
                  page: MyCoursesRoute.page,
                  path: "",
                ),
              ],
            ),
            AutoRoute(
              page: RootChat.page,
              path: RoutePath.chat,
              children: [
                AutoRoute(
                  page: ChatRoute.page,
                  path: "",
                ),
              ],
            ),
            AutoRoute(
              page: RootProfile.page,
              path: RoutePath.profile,
              children: [
                AutoRoute(
                  page: MyProfileRoute.page,
                  path: "",
                ),
              ],
            ),
          ],
        ),
        // =================

        // LESSON

        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          page: CourseDetailsRoute.page,
          path: RoutePath.courseDetails,
        ),
        CustomRoute(
          transitionsBuilder: TransitionsBuilders.noTransition,
          page: LessonRoute.page,
          path: RoutePath.lesson,
        ),

        AutoRoute(
          page: TestResultRoute.page,
          path: RoutePath.courseDetails,
        ),

        // QUIZ
        AutoRoute(
          page: TestsRoute.page,
          path: RoutePath.testsRoute,
        ),

        AutoRoute(
          page: QuizRoute.page,
          path: RoutePath.quizzes,
        ),

        AutoRoute(
          page: EitherResultRoute.page,
          path: RoutePath.eitherResult,
        ),

        AutoRoute(
            page: TicketMessagesRoute.page, path: RoutePath.ticketMessages),

        AutoRoute(page: ProfileUpdateRoute.page, path: RoutePath.profileUpdate),

        AutoRoute(page: ChatRoute.page, path: RoutePath.chatScreen),

        AutoRoute(page: TermsOfUseRoute.page, path: RoutePath.termsUse),
        AutoRoute(page: NoInternetRoute.page, path: RoutePath.noInternet),

        AutoRoute(page: CheckoutRoute.page, path: RoutePath.checkout),
      ];
}
