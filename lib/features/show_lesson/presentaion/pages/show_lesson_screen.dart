import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/core/resources/app_icons.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_circle_index_card.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_rating.dart';

import '../../../../core/resources/app_colors.dart';
import '../manager/lesson_show_bloc.dart';
import '../widgets/w_chewie_controller.dart';

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
    // _lessonShowBloc.add(LoadingLessonShow(lessonSlug: widget.slug, ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WChewiePlayer(
                url:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                isOpen: true),
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
                      "DTM 2022",
                      style: Styles.getCourseTitleStyle(),
                    ),
                    Text(
                      "Sardorxon Urfonxonov",
                      style: Styles.getTextStyle(color: AppColors.subTextColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const WCourseRating(),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Bo’lim 1 - Kirish',
                      style: Styles.courseSectionStyle(),
                    ),
                    Column(
                      children: [
                        ...List.generate(
                          2,
                              (index) =>
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: index == 1 ? AppColors
                                        .currentCourseCardColor : AppColors
                                        .white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: 0,
                                        blurRadius: 15,
                                        offset: const Offset(0, 10),
                                        color: Colors.black.withOpacity(0.05),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          WCircleIndexCard(index: index),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "DTM 2022 1-DARS",
                                                style: Styles.getLessonTitle(),
                                              ),
                                              Text(
                                                "Video - 15:22 min",
                                                style: Styles
                                                    .getLessonSubTitle(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(index == 0
                                          ? AppIcons.checkCircle
                                          : AppIcons.pause),
                                    ],
                                  ),
                                ),
                              ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: WButton(
                            borderRadius: 16,
                            textStyle: Styles.getButtonStyle(),
                            text: "taking_a_test_b_department".tr(),
                            onTap: () {
                              context.router.pushNamed(RoutePath.testsRoute);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )

      // BlocProvider(
      //   create: (context) => _lessonShowBloc,
      //   child: BlocBuilder<LessonShowBloc, LessonShowState>(
      //     builder: (context, state) {
      //       if (state is LessonShowInitial) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else if (state is LessonShowLoaded) {
      //         return Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             state.req.videoFiles[0].status == "main"
      //                 ? WChewiePlayer(url:  state.req.videoFiles[0].fileUrl,isOpen: state.req.isOpen=='open')
      //                 :   WPodController(url: state.req.videoFiles[0].fileUrl, isOpen: state.req.isOpen=='open',)
      //
      //           ],
      //         );
      //       }  else if(state is LessonShowError){
      //
      //       return  const Center(child: Text("error"),);
      //       } else {
      //
      //         return const SizedBox();
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
