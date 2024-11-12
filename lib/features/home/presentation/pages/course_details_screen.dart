import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_lesson%20_tabbar.dart';
import 'package:math_app/core/widgets/w_standard_tabbar.dart';
import 'package:math_app/features/home/presentation/manager/course_details_screen_bloc/course_details_screen_bloc.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_about.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_card.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_rating.dart';

import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../widgets/w_course_content.dart';

@RoutePage()
class CourseDetailsScreen extends StatefulWidget {
  final String slug;

  const CourseDetailsScreen({Key? key, required this.slug}) : super(key: key);

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
    // courseDetailsScreenBloc.add(GetCourseDetails(slug: widget.slug));
  }

  String title = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => courseDetailsScreenBloc,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.router.maybePop();
                  },
                  child: SvgPicture.asset(AppIcons.arrowLeftBadge),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "DTM 2022",
                  style: Styles.getCourseTitleStyle(),
                )
              ],
            ),
          ),
        ),
        body: BlocBuilder<CourseDetailsScreenBloc, CourseDetailsScreenState>(
            builder: (context, state) {
          // if(state is  CourseDetailsLoading){
          //
          //   return const Center(child: CircularProgressIndicator(),);
          // }else if(state is CourseDetailsLoaded){
          //   title=state.courseDetailsDto.title;
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Padding(
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
                            height: 174,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-C_UAhXq9GfuGO452EEzfbKnh1viQB9EDBQ&s",
                                fit: BoxFit.cover,
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
                                "152 000 so’m",
                                style: Styles.getActivePriceStyle()
                                    .copyWith(fontSize: 14),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                "200 000 so’m",
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
                                "Sardorxon Urfonxonov",
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
                          children: const [
                            WCourseAbout(
                              excerpt: '',
                              description: "state.courseDetailsDto.description",
                            ),
                            WCourseContent(slug: '')
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
                                "152 000 so’m",
                                style: Styles.getTextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
          // } else if(state is CourseDetailsError){
          //   return const Center(child: Text("Error"),);
          // } else{
          //   return const SizedBox();
          // }
        }),
      ),
    );
  }
}
