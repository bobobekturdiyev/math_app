import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';

class WLessonTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;
  final EdgeInsets padding;
  final double radius;

  const WLessonTabBar({
    Key? key,
    required this.tabController,
    required this.tabs,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TabBar(
        controller: tabController,
        indicatorPadding: EdgeInsets.zero,
        indicatorColor: Colors.white,
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
        ),
        labelColor: AppColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle:
            Styles.getTextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        indicatorWeight: 2,
        unselectedLabelStyle:
            Styles.getTextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        unselectedLabelColor: AppColors.subTextColor,
        tabs: tabs,
        isScrollable: true,
        padding: padding,
        splashBorderRadius: BorderRadius.zero,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
      ),
    );
  }
}
