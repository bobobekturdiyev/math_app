import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/state/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/core/widgets/w_non_auth.dart';
import 'package:math_app/features/my_courses/presentation/manager/my_course_screen/my_course_screen_bloc.dart';

import '../widgets/w_my_course_item.dart';

@RoutePage()
class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  MyCourseScreenBloc myCourseScreenBloc = MyCourseScreenBloc();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Function? onRefresh;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyCourseScreenBloc>.value(
      value: myCourseScreenBloc,
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: RefreshIndicator(
            color: AppColors.primaryColor,
            backgroundColor: AppColors.white,
            onRefresh: () async {
              if (onRefresh == null) {
                myCourseScreenBloc.add(GetMyCourses());
              } else {
                // onRefresh!();
              }
            },
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  backgroundColor: AppColors.white,
                  title: Text(
                    'Mening kurslarim',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                BlocBuilder<MyCourseScreenBloc, MyCourseScreenState>(
                  builder: (context, state) {
                    if (state is MyCoursesLoaded) {
                      return SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(height: 16),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    context.router.push(
                                      CourseDetailsRoute(
                                          courseDto: state.courses[index]),
                                    );
                                  },
                                  child: WMyCourseItem(
                                    course: state.courses[index],
                                  ),
                                  // child: WCourseCard(
                                  //   course: state.courses[index],
                                  // ),
                                ),
                              ),
                              itemCount: state.courses.length,
                            ),
                          ],
                        ),
                      );
                    } else if (state is MyCourseLoading) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: WLoader(),
                        ),
                      );
                    } else if (state is MyCoursesError) {
                      if (state.code != null && state.code == 401) {
                        return SliverList(
                          delegate: SliverChildListDelegate([
                            WNonAuth(
                              text:
                                  "Kurslar ochilishi uchun, dastlab, tizimga kirgan bo'lishingiz kerak",
                              onLoginTap: () {
                                locator<BottomNavBarBloc>()
                                    .add(OpenPage(path: RoutePath.profile));
                              },
                            )
                          ]),
                        );
                      }

                      return SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Text(state.message),
                            WButton(
                              text: 'Qayta yuklash',
                              onTap: () {
                                myCourseScreenBloc.add(GetMyCourses());
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: SizedBox(),
                      );
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
