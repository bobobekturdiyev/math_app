import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_colors.dart';
import 'package:math_app/core/state/bloc/auth/auth_bloc.dart';
import 'package:math_app/core/util/dialog_helper.dart';
import 'package:math_app/core/widgets/w_html.dart';
import 'package:math_app/core/widgets/w_standard_tabbar.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/presentation/manager/course_access/course_access_bloc.dart';
import 'package:math_app/features/home/presentation/manager/course_details/course_details_tab_provider.dart';
import 'package:math_app/features/home/presentation/manager/course_details_screen_bloc/course_details_screen_bloc.dart';
import 'package:math_app/features/home/presentation/manager/module/course_module_bloc.dart';
import 'package:math_app/features/home/presentation/widgets/categories_header_delagate.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/styles.dart';
import '../../../../core/util/helpers.dart';
import '../../../../core/widgets/w_button.dart';
import '../../../../core/widgets/w_loader.dart';
import '../widgets/w_cover_image.dart';
import '../widgets/w_expansion.dart';

@RoutePage()
class CourseDetailsScreen extends StatefulWidget {
  final CourseDto courseDto;

  const CourseDetailsScreen({Key? key, required this.courseDto})
      : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late CourseDetailsScreenBloc courseDetailsScreenBloc;
  CourseDetailsTabProvider courseDetailsTabProvider =
      CourseDetailsTabProvider();

  YoutubePlayerController? youtubePlayerController;

  CourseModuleBloc courseModuleBloc = CourseModuleBloc();
  CourseAccessBloc courseAccessBloc = CourseAccessBloc();

  @override
  void initState() {
    init();

    super.initState();
  }

  void init() {
    final course = widget.courseDto;
    if (course.id != null) {
      courseAccessBloc.add(LoadCourseAccess(courseId: course.id!));
      courseModuleBloc.add(LoadModules(courseId: course.id!));
    }

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          courseDetailsTabProvider.setIndex(tabController.index);
        });
      }
    });

    if (course.trailer != null) {
      final videoId = YoutubePlayer.convertUrlToId(course.trailer!);

      youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          hideThumbnail: true,
          forceHD: true,
          showLiveFullscreenButton: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    tabController.dispose();

    if (youtubePlayerController != null) {
      youtubePlayerController!.dispose();
    }

    super.dispose();
  }

  String title = '';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CourseModuleBloc>.value(
          value: courseModuleBloc,
        ),
        BlocProvider<CourseAccessBloc>.value(
          value: courseAccessBloc,
        ),
      ],
      child: ChangeNotifierProvider<CourseDetailsTabProvider>(
        create: (ctx) => courseDetailsTabProvider,
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.white,
              onRefresh: () async {
                init();
              },
              child: CustomScrollView(
                slivers: [
                  _getAppBar(),
                  _getHeader(),
                  _getInfoList(),
                  _getTabBar(),
                  _getTabView(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _getBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _getAppBar() => SliverAppBar(
        floating: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        titleSpacing: 16,
        title: Row(
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
              widget.courseDto.title ?? "?title",
              style: Styles.getCourseTitleStyle(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      );

  Widget _getHeader() {
    if (widget.courseDto.trailer != null && youtubePlayerController != null) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: YoutubePlayer(controller: youtubePlayerController!),
          ),
        ),
      );
    } else if (widget.courseDto.image != null) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: WCoverImage(
            image: widget.courseDto.image!,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
        ),
      );
    } else {
      return SliverToBoxAdapter();
    }
  }

  _getInfoList() => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.courseDto.totalLessons != null) ...{
                          const Icon(
                            Icons.list_alt_rounded,
                            color: AppColors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.courseDto.totalLessons!.toString()} ta mavzu",
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 12),
                        },
                        if (widget.courseDto.totalVideos != null) ...{
                          const Icon(
                            Icons.video_file_outlined,
                            color: AppColors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${widget.courseDto.totalVideos!.toString()} ta video",
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 12),
                        },
                        if (widget.courseDto.duration != null) ...{
                          const Icon(
                            Icons.video_collection_outlined,
                            color: AppColors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.courseDto.duration!,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 12),
                        },
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  _getTabBar() => SliverPersistentHeader(
        pinned: true,
        delegate: CategoriesHeaderDelegate(
          minHeight: 55,
          maxHeight: 55,
          child: Container(
            color: AppColors.white,
            child: WStandardTabBar(
              // padding: const EdgeInsets.symmetric(horizontal: 24),
              tabController: tabController,
              tabs: [
                Tab(
                  text: "Darslar",
                ),
                Tab(
                  text: "Kurs haqida",
                ),
              ],
            ),
          ),
        ),
      );

  _getTabView() =>
      Consumer<CourseDetailsTabProvider>(builder: (_, model, child) {
        if (model.currentIndex == 1) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: WHtml(
                htmlContent: widget.courseDto.description ?? "",
              ),
            ),
          );
        } else {
          return BlocBuilder<CourseAccessBloc, CourseAccessState>(
            builder: (accessContext, accessState) {
              return BlocBuilder<CourseModuleBloc, CourseModuleState>(
                builder: (context, state) {
                  if (state is CourseModuleLoaded) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: WExpansionTile(
                            module: state.modules[index],
                            courseAccess: accessState is CourseAccessLoaded
                                ? accessState.courseAccessDto.courseAccess
                                : false,
                            moduleAccess: true,
                          ),
                        ),
                        childCount: state.modules.length,
                      ),
                    );
                  } else if (state is CourseModuleLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: WLoader(),
                      ),
                    );
                  } else if (state is CourseModuleError &&
                      widget.courseDto.id != null) {
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Text(state.message),
                          WButton(
                            text: 'Qayta yuklash',
                            onTap: () {
                              courseModuleBloc.add(
                                LoadModules(
                                  courseId: widget.courseDto.id!,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter();
                  }
                },
              );
            },
          );
        }
      });

  Widget? _getBottomNavigationBar() {
    return BlocBuilder<CourseAccessBloc, CourseAccessState>(
        builder: (ctx, state) {
      if (((state is CourseAccessLoaded &&
                  !state.courseAccessDto.courseAccess) ||
              state is CourseAccessError) &&
          widget.courseDto.price != null &&
          widget.courseDto.price! > 0) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: WButton(
            text:
                "Xarid qilish — ${Helper.priceFormat(widget.courseDto.price!)}",
            onTap: () {
              if (!locator<AuthBloc>().loggedIn) {
                DialogHelper.loginDialog(
                    context: context,
                    message:
                        "Kursni xarid qilish uchun dastlab tizimga kiring");
              }
            },
          ),
        );
      }

      return SizedBox();
    });
  }
}
