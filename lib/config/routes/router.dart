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
          page: TestsRoute.page,
          path: RoutePath.testsRoute,
        ),

        AutoRoute(
          page: QuizRoute.page,
          path: RoutePath.quizzes,
        ),

        AutoRoute(
          page: TicketMessagesRoute.page,
          path: RoutePath.ticketMessages,
        ),

        AutoRoute(
          page: EitherResultRoute.page,
          path: RoutePath.eitherResult,
        ),

        AutoRoute(
          page: CostIncomeRoute.page,
          path: RoutePath.costIncome,
        ),
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

        AutoRoute(
          page: ChatRoute.page,
          path: RoutePath.chatScreen,
        ),

        AutoRoute(
          page: PlanRoute.page,
          path: RoutePath.plan,
        ),
        AutoRoute(
          page: AboutRoute.page,
          path: RoutePath.about,
        ),
        AutoRoute(
          page: TermsOfUseRoute.page,
          path: RoutePath.termsUse,
        ),
        AutoRoute(
          page: UpdatePasswordRoute.page,
          path: RoutePath.updatePassword,
        ),
        AutoRoute(
          page: ShowLessonRoute.page,
          path: RoutePath.showLesson,
        ),
        AutoRoute(
          page: AboutAddRoute.page,
          path: RoutePath.aboutAdd,
        ),
        AutoRoute(
          page: SkillsRoute.page,
          path: RoutePath.skillsScreen,
        ),
        AutoRoute(
          page: LanguageEditRoute.page,
          path: RoutePath.language,
        ),
        AutoRoute(
          page: ExperienceRoute.page,
          path: RoutePath.experience,
        ),
        AutoRoute(
          page: EducationRoute.page,
          path: RoutePath.education,
        ),
        AutoRoute(
          page: AwardRoute.page,
          path: RoutePath.award,
        ),
      ];
}
