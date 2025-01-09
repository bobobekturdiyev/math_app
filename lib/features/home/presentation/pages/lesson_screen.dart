import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:math_app/features/home/data/model/course/lesson_dto.dart';

@RoutePage()
class LessonScreen extends StatefulWidget {
  final LessonShortDto lessonShortDto;

  const LessonScreen({
    super.key,
    required this.lessonShortDto,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
