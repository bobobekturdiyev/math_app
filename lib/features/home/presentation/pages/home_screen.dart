import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/state/bloc/main_data/user_bloc.dart';
import 'package:math_app/core/widgets/w_bottomsheet.dart';
import 'package:math_app/core/widgets/w_radio_group.dart';
import 'package:math_app/core/widgets/w_shimmer_loader.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/home/domain/usecases/home_usecase.dart';
import 'package:math_app/features/home/presentation/manager/home_bloc/home_screen_event.dart';
import 'package:math_app/features/home/presentation/manager/home_bloc/home_screen_state.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_card.dart';
import 'package:math_app/features/home/presentation/widgets/w_welcome_text.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_icons.dart';
import '../manager/home_bloc/home_screen_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(
        homeUseCases: HomeUseCases(
          homeRepo: context.read(),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          toolbarHeight: 72,
          // centerTitle: true,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.backgroundColor,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ColoredBox(
              color: AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                WWelcomeText(),
                  InkWell(
                      onTap: () {
                        context.router.pushNamed(RoutePath.notification);
                      },
                      child: SvgPicture.asset(AppIcons.notificationWithBadge)),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 28,
              ),
              Builder(builder: (context) {
                return WTextField(
                  controller: controller,
                  hint: "search".tr(),
                  onChanged: (query) {
                    if (_debounce?.isActive ?? false) _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 500), () {
                      context
                          .read<HomeScreenBloc>()
                          .add(GetAllCourse(searchQuery: query));
                    });
                  },
                  hintFontSize: 12,
                  prefixIcon: SvgPicture.asset(
                    AppIcons.search,
                    fit: BoxFit.none,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      showFilterSheet(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.filter,
                      fit: BoxFit.none,
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    if (state is AllCourseLoading) {
                      return ListView.builder(
                          itemCount: 8,
                          itemBuilder: (ctx, index) {
                            return _shimmer();
                          });
                    } else if (state is AllCourseLoaded) {
                      return ListView.builder(
                        itemCount: state.allCourse.length,
                        itemBuilder: (ctx, index) {
                          return WCourseCard(
                            allCourseEntity: state.allCourse[index],
                            onTap: () {
                              context.router.push(CourseDetailsRoute(
                                  slug: state.allCourse[index].slug,
                                  title: state.allCourse[index].name));
                            },
                          );
                        },
                      );
                    } else if (state is AllCourseError) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _shimmer() => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: WShimmerLoader(
              width: double.infinity,
              height: 152,
              shimmerMode: WShimmerMode.light,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          WShimmerLoader(
            shimmerMode: WShimmerMode.light,
          ),
          SizedBox(
            height: 12,
          ),
          WShimmerLoader(
            width: double.infinity,
            shimmerMode: WShimmerMode.light,
          ),
        ],
      );

  showFilterSheet(BuildContext mainCtx) {
    showModalBottomSheet(
      context: locator<GlobalKey<ScaffoldState>>().currentContext!,
      builder: (ctx) {
        return WBottomSheet(
          title: "select_the_appropriate_category".tr(),
          body: WRadioGroup(
            items: ["Barcha kurslar", "Bepul kurslar", "Pullik kurslar"],
            onChange: (e) {
              String? filter;
              if (e == 0) {
                filter = 'all';
              } else if (e == 1) {
                filter = 'free';
              } else {
                filter = 'paid';
              }
              mainCtx.read<HomeScreenBloc>().add(GetAllCourse(filter: filter));
            },
          ),
        );
      },
    );
  }
}
