import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/shared/domain/shared_entities/lesson_entity.dart';
import 'package:math_app/core/shared/domain/shared_entities/module_entity.dart';
import 'package:math_app/core/widgets/video_player/universal_video_player.dart';
import 'package:math_app/core/widgets/video_player/video_player_ctrl.dart';
import 'package:math_app/core/widgets/w_appbar.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_standard_tabbar.dart';

import 'package:math_app/features/home/presentation/manager/course_details_screen_bloc/course_details_screen_bloc.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_about.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_rating.dart';

import '../../../../core/resources/styles.dart';
import '../widgets/w_course_content.dart';

@RoutePage()
class CourseDetailsScreen extends StatefulWidget {
  final String slug;
  final String title;

  const CourseDetailsScreen({Key? key, required this.slug, required this.title})
      : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late CourseDetailsScreenBloc courseDetailsScreenBloc;

  @override
  void initState() {
    init();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void init() {
    courseDetailsScreenBloc = CourseDetailsScreenBloc(homeRepo: context.read());
    courseDetailsScreenBloc.add(GetCourseDetails(slug: widget.slug));
  }

  late VideoController controller;

  @override
  void dispose() {
    if(controller.isInitialized){
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => courseDetailsScreenBloc,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: WAppBar(title: widget.title),
        body: BlocBuilder<CourseDetailsScreenBloc, CourseDetailsScreenState>(
            builder: (context, state) {
          if (state is CourseDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CourseDetailsLoaded) {
            controller = VideoController(
              playlist:
                  convertModulesToPlaylist(state.courseDetailsEntity.modules),
            );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        // height: 174,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: UniversalVideoPlayer(
                            controller: controller,
                            onCompleted: (LessonEntity current) {},
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const WCourseRating(),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Text(
                            "${state.courseDetailsEntity.discountPrice} so’m",
                            style: Styles.getActivePriceStyle()
                                .copyWith(fontSize: 14),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${state.courseDetailsEntity.price} so’m",
                            style: Styles.getDeActivePriceStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "teacher".tr(),
                            style: Styles.getTextStyle(fontSize: 12),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            state.courseDetailsEntity.author,
                            style: Styles.getActivePriceStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      WStandardTabBar(
                        // padding: const EdgeInsets.symmetric(horizontal: 24),
                        tabController: tabController,
                        tabs: [
                          Tab(
                            text: "details".tr(),
                          ),
                          Tab(
                            text: "text_books".tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        WCourseAbout(
                          description: state.courseDetailsEntity.description,
                        ),
                        WCourseContent(
                          modules: state.courseDetailsEntity.modules,
                          onLessonTap: (int index) {
                            if (convertModulesToPlaylist(state
                                        .courseDetailsEntity.modules)[index]
                                    .hasAccess ==
                                1) {
                              controller.playAt(index);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: WButton(
                      text: "",
                      borderRadius: 16,
                      verticalPadding: 12,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Text(
                            "buy".tr(),
                            style: Styles.getTextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "${state.courseDetailsEntity.discountPrice} so’m",
                            style: Styles.getTextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  )
                ],
              ),
            );
          } else if (state is CourseDetailsError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return const SizedBox();
          }
        }),
      ),
    );
  }

  List<LessonEntity> convertModulesToPlaylist(List<ModuleEntity> modules) {
    List<LessonEntity> playlist = [];

    for (var module in modules) {
      for (var lesson in module.lessons) {
        playlist.add(
          LessonEntity(
            id: lesson.id,
            title: lesson.title,
            duration: lesson.duration,
            hasAccess: lesson.hasAccess,
            isWatched: lesson.isWatched,
            videoUrl: lesson.videoUrl,
          ),
        );
      }
    }

    return playlist;
  }
}
