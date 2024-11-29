import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/shared/domain/shared_entities/lesson_entity.dart';
import 'package:math_app/core/shared/domain/shared_entities/module_entity.dart';
import 'package:math_app/core/widgets/video_player/universal_video_player.dart';
import 'package:math_app/core/widgets/video_player/video_player_ctrl.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_rating.dart';
import 'package:math_app/features/show_lesson/presentation/widgets/w_lessons_item.dart';

import '../../../../core/resources/app_colors.dart';
import '../manager/lesson_show_bloc.dart';

@RoutePage()
class ShowLessonScreen extends StatefulWidget {
  final String slug;

  const ShowLessonScreen({Key? key, required this.slug}) : super(key: key);

  @override
  State<ShowLessonScreen> createState() => _ShowLessonScreenState();
}

class _ShowLessonScreenState extends State<ShowLessonScreen> {
  late LessonShowBloc _lessonShowBloc;

  @override
  void initState() {
    _lessonShowBloc = LessonShowBloc(showLessonRepo: context.read());
    _lessonShowBloc.add(GetCourseBySlug(
      lessonSlug: widget.slug,
    ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late VideoController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => _lessonShowBloc,
        child: BlocBuilder<LessonShowBloc, LessonShowState>(
          builder: (context, state) {
            if (state is LessonShowInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LessonShowLoaded) {
              controller = VideoController(
                playlist: convertModulesToPlaylist(state.courseEntity.modules),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UniversalVideoPlayer(controller: controller, 
                    onCompleted: (LessonEntity current) {

                      _lessonShowBloc.add(LessonMarkAsWatched(lessonId: current.id));
                    },),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            state.courseEntity.name,
                            style: Styles.getCourseTitleStyle(),
                          ),
                          Text(
                            state.courseEntity.author,
                            style: Styles.getTextStyle(
                                color: AppColors.subTextColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const WCourseRating(),
                          const SizedBox(
                            height: 24,
                          ),
                          ...List.generate(
                            state.courseEntity.modules.length,
                            (moduleIndex) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.courseEntity.modules[moduleIndex].name,
                                  style: Styles.courseSectionStyle(),
                                ),

                                Column(
                                  children: [
                                    ListView.builder(
                                        itemCount:  state
                                            .courseEntity
                                            .modules[moduleIndex]
                                            .lessons.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (ctx, index) {
                                          return WLessonsItem(
                                            lessonEntity: state
                                                .courseEntity
                                                .modules[moduleIndex]
                                                .lessons[index],
                                            onTap: () {
                                              controller.playAt(index);
                                            },
                                            index: index,
                                            isPLaying:
                                                controller.currentIndex ==
                                                    index,
                                          );
                                        }),
                                    SizedBox(
                                      width: double.infinity,
                                      child: WButton(
                                        borderRadius: 16,
                                        textStyle: Styles.getButtonStyle(),
                                        text: "taking_a_test_b_department".tr(),
                                        onTap: () {
                                        if(state.courseEntity.modules[moduleIndex].quizId!=0)  {
                                            context.router.push(QuizRoute(
                                                quizId: state
                                                    .courseEntity
                                                    .modules[moduleIndex]
                                                    .quizId));
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is LessonShowError) {
              return const Center(
                child: Text("error"),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
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
