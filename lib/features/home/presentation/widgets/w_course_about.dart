import 'package:flutter/material.dart';
import 'package:math_app/core/resources/styles.dart';

class WCourseAbout extends StatelessWidget {
  final String excerpt;
  final String description;

  const WCourseAbout(
      {Key? key, required this.excerpt, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            "In at pulvinar pellentesque etiam. Eget nulla nibh posuere magna dolor. Velit faucibus eget nunc diam non adipiscing urna lorem tortor. Mollis bibendum varius id natoque netus nam ipsum nisi sit. Nisl donec auctor pretium lectus lorem magna mi.Nec neque risus dignissim consectetur augue tempus vitae elit lorem.",
            style: Styles.getCourseAboutTextStyle(),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
