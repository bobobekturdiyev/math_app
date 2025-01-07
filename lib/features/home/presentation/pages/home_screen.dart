import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:math_app/features/home/presentation/widgets/w_category.dart';
import 'package:math_app/features/home/presentation/widgets/w_course_card.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_icons.dart';
import '../manager/home_bloc/home_screen_bloc.dart';
import '../widgets/categories_header_delagate.dart';

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
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: AppColors.white,
                title: WTextField(
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
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CategoriesHeaderDelegate(
                minHeight: 50,
                maxHeight: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding:  EdgeInsets.only(left: index == 0 ? 16 : 0.0, right: index == 3 ? 16 : 0),
                          child: WCategory(
                            text: "Barchasi $index",
                            isActive: index == 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(CourseDetailsRoute(slug: 'slug'));
                    },
                    child: const WCourseCard(),
                  ),
                ),
              ),
            ),
          ],
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


