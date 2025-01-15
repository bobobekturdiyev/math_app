import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/widgets/unfocus.dart';
import 'package:math_app/core/widgets/w_button.dart';
import 'package:math_app/core/widgets/w_loader.dart';
import 'package:math_app/core/widgets/w_logo.dart';
import 'package:math_app/features/home/presentation/manager/category/category_home_bloc.dart';
import 'package:math_app/features/home/presentation/manager/course/course_home_bloc.dart';
import 'package:math_app/features/home/presentation/widgets/w_category.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_card.dart';
import 'package:math_app/features/home/presentation/widgets/w_search.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/app_colors.dart';
import '../widgets/categories_header_delagate.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  CourseHomeBloc courseHomeBloc = CourseHomeBloc();
  CategoryHomeBloc categoryHomeBloc = CategoryHomeBloc();

  @override
  void initState() {
    super.initState();
  }

  bool showCategorySection = true;
  Function? onRefresh;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CourseHomeBloc>.value(
          value: courseHomeBloc,
        ),
        BlocProvider<CategoryHomeBloc>.value(
          value: categoryHomeBloc,
        ),
      ],
      child: BlocListener<CategoryHomeBloc, CategoryHomeState>(
        listener: (context, state) {
          if (state is CategoryHomeLoaded && state.categories.isEmpty) {
            showCategorySection = false;
          }
        },
        child: Unfocus(
          child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.white,
              onRefresh: () async {
                if (onRefresh == null) {
                  courseHomeBloc.add(const LoadCourses());
                  categoryHomeBloc.add(LoadCategories());
                } else {
                  onRefresh!();
                }
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: false,
                    floating: true,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    backgroundColor: AppColors.white,
                    title: Row(
                      children: [
                        WLogo(
                          size: 48,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: WSearch(
                            onSubmitted: (str) {
                              onRefresh = () {
                                courseHomeBloc.add(SearchCourse(query: str));
                                categoryHomeBloc
                                    .add(const CategoryHomeHideSelect());
                              };

                              onRefresh!();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (showCategorySection) ...{
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: CategoriesHeaderDelegate(
                        minHeight: 50,
                        maxHeight: 50,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: BlocBuilder<CategoryHomeBloc,
                                CategoryHomeState>(
                              builder: (context, state) {
                                if (state is CategoryHomeLoading) {
                                  return Row(
                                    children: List.generate(
                                      4,
                                      (index) => Padding(
                                        padding: EdgeInsets.only(
                                            left: index == 0 ? 16 : 0.0,
                                            right: 16),
                                        child: Shimmer.fromColors(
                                          baseColor:
                                              AppColors.shimmerAnimateLight,
                                          highlightColor: AppColors
                                              .shimmerAnimatePrimaryLight,
                                          child: WCategory(
                                            onTap: () {},
                                            text: "Barchasi $index",
                                            isActive: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (state is CategoryHomeLoaded) {
                                  return Row(
                                    children: List.generate(
                                      state.categories.length + 1,
                                      (index) {
                                        if (index == 0) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                left: 16,
                                                right: index ==
                                                        state.categories
                                                                .length -
                                                            1
                                                    ? 16
                                                    : 0),
                                            child: WCategory(
                                              onTap: () {
                                                onRefresh = () {
                                                  categoryHomeBloc.add(
                                                      const CategoryHomeSelect(
                                                          id: 0));
                                                  courseHomeBloc
                                                      .add(const LoadCourses());
                                                };

                                                onRefresh!();
                                              },
                                              text: "Barchasi",
                                              isActive: 0 ==
                                                  categoryHomeBloc.selectedId,
                                            ),
                                          );
                                        }

                                        var category =
                                            state.categories[index - 1];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              right: index ==
                                                      state.categories.length
                                                  ? 16
                                                  : 0),
                                          child: WCategory(
                                            onTap: () {
                                              if (categoryHomeBloc.selectedId !=
                                                  category.id) {
                                                onRefresh = () {
                                                  categoryHomeBloc.add(
                                                      CategoryHomeSelect(
                                                          id: category.id ??
                                                              0));
                                                  courseHomeBloc.add(
                                                      LoadCourses(
                                                          categoryId:
                                                              category.id));
                                                };

                                                onRefresh!();
                                              }
                                            },
                                            text: category.name ?? "cat??",
                                            isActive: category.id ==
                                                categoryHomeBloc.selectedId,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else if (state is CategoryHomeError) {
                                  return Text(
                                    state.message,
                                    style: const TextStyle(
                                        color: AppColors.danger, fontSize: 12),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  },
                  BlocBuilder<CourseHomeBloc, CourseHomeState>(
                    builder: (context, state) {
                      if (state is CourseHomeLoaded) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.router.push(CourseDetailsRoute(
                                            courseDto: state.courses[index]));
                                      },
                                      child: WCourseCard(
                                        course: state.courses[index],
                                      ),
                                    ),
                                  ),
                              childCount: state.courses.length),
                        );
                      } else if (state is CourseHomeLoading) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: WLoader(),
                          ),
                        );
                      } else if (state is CourseHomeError) {
                        return SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Text(state.message),
                              WButton(
                                text: 'Qayta yuklash',
                                onTap: () {
                                  courseHomeBloc.add(LoadCourses());
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
            ),
          ),
        ),
      ),
    );
  }
}
