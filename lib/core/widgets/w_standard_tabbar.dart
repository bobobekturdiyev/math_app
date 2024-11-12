import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/styles.dart';

class WStandardTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;
  final bool isScrollable;
  final double labelHorizontalPadding;

  const WStandardTabBar({
    Key? key,
    required this.tabController,
    required this.tabs,
    this.isScrollable = false,
    this.labelHorizontalPadding = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey,
          ),
        ),
      ),
      child: Theme(
        data: ThemeData(

          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: TabBar(
          padding: EdgeInsets.zero,
           indicatorColor: AppColors.primaryColor,
          controller: tabController,
          labelColor: AppColors.primaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle:
              Styles.getTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          indicatorWeight: 2,
          isScrollable: isScrollable,
          unselectedLabelColor: AppColors.subTextColor,
          tabs: tabs,
          splashBorderRadius: BorderRadius.circular(50),
          labelPadding:
              EdgeInsets.symmetric(horizontal: labelHorizontalPadding),
        ),
      ),
    );
  }
}
