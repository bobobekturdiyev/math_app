import 'package:flutter/material.dart';
import 'package:math_app/core/resources/styles.dart';

class WCourseAbout extends StatelessWidget {
  final String description;

  const WCourseAbout({Key? key, required this.description}) : super(key: key);

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
            description,
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
