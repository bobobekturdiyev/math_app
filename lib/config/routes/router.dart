import 'package:auto_route/auto_route.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/features/auth/presentation/manager/provider/auth_guard.dart';
import 'route_path.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //AUTH
        AutoRoute(
          page: LoginRoute.page,
          path: RoutePath.login,
          initial: true,
          guards: [AuthGuard()]
        ),


        //================

        AutoRoute(
          page: AppMainRoute.page,
          path: RoutePath.main,
          children: [
            AutoRoute(

              page: RootHome.page,
              path: RoutePath.home,
              // initial: true,
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
                  page: ChatListRoute.page,
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
                // AutoRoute(
                //   page: ChangePasswordRoute.page,
                //   path: RoutePath.changePassword,
                // ),
              ],
            ),
          ],
        ),
        // =================

        AutoRoute(
          page: FAQRoute.page,
          path: RoutePath.FAQ,
        ),   AutoRoute(
          page: PrivacyPolicyRoute.page,
          path: RoutePath.privacyPolicy,
        ),   AutoRoute(
          page: ChangePasswordRoute.page,
          path: RoutePath.changePassword,
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: RoutePath.settings,
        ),
        AutoRoute(
          page: QuizRoute.page,
          path: RoutePath.quizRoute,
        ),
        AutoRoute(
          page: EitherResultRoute.page,
          path: RoutePath.eitherResult,
        ),

        AutoRoute(
          page: PersonalInfoRoute.page,
          path: RoutePath.personalInfo,
        ),

        AutoRoute(
          page: CourseDetailsRoute.page,
          path: RoutePath.courseDetails,
        ),

        AutoRoute(
          page: TestResultRoute.page,
          path: RoutePath.courseDetails,
        ),

        AutoRoute(
          page: NotificationRoute.page,
          path: RoutePath.notification,
        ),
        AutoRoute(
          page: ChatRoute.page,
          path: RoutePath.chatScreen,
        ),

        AutoRoute(
          page: ShowLessonRoute.page,
          path: RoutePath.showLesson,
        ),
      ];
}
