import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';

class WTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;
  final EdgeInsets padding;
  final double radius;

  const WTabBar({
    Key? key,
    required this.tabController,
    required this.tabs,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.radius = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        indicatorColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        tabAlignment: TabAlignment.fill,
        controller: tabController,
        indicator: BoxDecoration(
          color: AppColors.primaryColor,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(radius),
        ),
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        labelPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        labelColor: AppColors.white,
        dividerColor: AppColors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: Styles.getTextStyle(),
        indicatorWeight: 0,
        unselectedLabelColor: AppColors.grey,
        tabs: tabs,
        // isScrollable: true,
        padding: padding,
        splashBorderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
