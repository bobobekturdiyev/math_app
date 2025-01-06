import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/features/my_courses/presentation/manager/my_course_screen/my_course_screen_bloc.dart';
import 'package:math_app/features/my_courses/presentation/widgets/w_filter_group.dart';
import 'package:math_app/features/my_courses/presentation/widgets/w_my_course_item.dart';

@RoutePage()
class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCourseScreenBloc(myCourseRepo: context.read()),
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            toolbarHeight: 72,
            scrolledUnderElevation: 0,
            backgroundColor: AppColors.backgroundColor,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "my_courses".tr(),
                    style: Styles.getTextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppIcons.dotsBadge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  return WFilterGroup(
                    items: ['all'.tr(), 'in_process'.tr(), 'complete'.tr()],
                    onChange: (index) {
                      MyCourseFilter myCourseFilter = MyCourseFilter.all;
                      switch (index) {
                        case 0:
                          myCourseFilter = MyCourseFilter.all;
                          break;
                        case 1:
                          myCourseFilter = MyCourseFilter.in_proccess;
                          break;
                        case 2:
                          myCourseFilter = MyCourseFilter.completed;
                          break;
                      }
                      context
                          .read<MyCourseScreenBloc>()
                          .add(GetMyCourses(filter: myCourseFilter));
                    },
                  );
                }
              ),
              Expanded(
                child: BlocBuilder<MyCourseScreenBloc, MyCourseScreenState>(
                    builder: (context, state) {
                  if (state is MyCourseLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is MyCoursesLoaded) {
                    return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: state.myCourses.length,
                        itemBuilder: (context, index) {
                          return WMyCourseItem(
                            myCourse: state.myCourses[index],
                            onTap: () {
                              context.router.push(ShowLessonRoute(
                                slug: state.myCourses[index].slug,
                              ));
                            },
                          );
                        });
                  } else if (state is MyCoursesError) {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                  // else if (state is NoAuth) {
                  //   return Center(child: WButton(
                  //       text: "Kirish", onTap: () {
                  //     context.router.replaceNamed(RoutePath.login);
                  //   }),);
                  // }
                  else {
                    return const SizedBox();
                  }
                }),
              ),
            ],
          )),
    );
  }
}
