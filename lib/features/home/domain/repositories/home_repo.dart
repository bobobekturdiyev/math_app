import 'package:math_app/features/home/data/model/all_course/all_course_dto.dart';
import 'package:math_app/features/home/data/model/lesson_by_course/lesson_by_course.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/course_details/course_details_dto.dart';

abstract class HomeRepo{
  Future<DataState<List<AllCourseDto>>> getAllCourse();
  Future<DataState<CourseDetailsDto>> getCourseDetails({required String slug});
  Future<DataState<List<LessonByCourseDto>>> getLesson({required String slug});

}