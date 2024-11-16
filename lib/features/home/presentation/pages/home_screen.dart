import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:math_app/config/routes/route_path.dart';
import 'package:math_app/config/routes/router.gr.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/app_images.dart';
import 'package:math_app/core/resources/styles.dart';
import 'package:math_app/core/widgets/w_bottomsheet.dart';
import 'package:math_app/core/widgets/w_checkbox_group.dart';
import 'package:math_app/core/widgets/w_radio_group.dart';
import 'package:math_app/core/widgets/w_tabbar.dart';
import 'package:math_app/core/widgets/w_textfield.dart';
import 'package:math_app/features/home/presentation/pages/premium_course_page.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_card.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(homeRepo: context.read()),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "hi_user".tr(namedArgs: {"name": "Hafiz"}),
                        style: Styles.getHiUserStyle(),
                      ),
                      Row(
                        children: [
                          Text(
                            "suit_yourself".tr(),
                            style: Styles.getTextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "course".tr(),
                            style: Styles.getTextStyle(
                              fontSize: 12,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "find".tr(),
                            style: Styles.getTextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        context.router.pushNamed(RoutePath.notification);
                      },
                      child: SvgPicture.asset(AppIcons.notification)),
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
              WTextField(
                controller: controller,
                hint: "search".tr(),
                hintFontSize: 12,
                prefixIcon: SvgPicture.asset(
                  AppIcons.search,
                  fit: BoxFit.none,
                ),
                suffixIcon: GestureDetector(
                  onTap: showFilterSheet,
                  child: SvgPicture.asset(
                    AppIcons.filter,
                    fit: BoxFit.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      context.router.push(CourseDetailsRoute(slug: 'slug'));
                    },
                    child: const WCourseCard(),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  showFilterSheet() {
    showModalBottomSheet(
      context: locator<GlobalKey<ScaffoldState>>().currentContext!,
      builder: (ctx) {
        return WBottomSheet(
          title: "select_the_appropriate_category".tr(),
          body: Column(
            children: [
              WRadioGroup(
                items: ["Barcha kurslar", "Bepul kurslar", "Pullik kurslar"],
                onChange: (e) {},
              ),
            ],
          ),
        );
      },
    );
  }
}
