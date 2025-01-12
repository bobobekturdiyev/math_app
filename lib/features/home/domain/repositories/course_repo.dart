import 'package:math_app/features/home/data/model/course/category_dto.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/data/model/course/lesson_dto.dart';
import 'package:math_app/features/home/data/model/course/module_dto.dart';
import 'package:math_app/features/home/domain/entities/search_course_request.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/course/course_access_dto.dart';

abstract class CourseRepo {
  Future<DataState<List<CourseDto>>> getCourses({int? categoryId});

  Future<DataState<List<CourseDto>>> getMyCourses({String? state});

  Future<DataState<List<CategoryDto>>> getCategories();

  Future<DataState<List<CourseDto>>> searchCourse(
      {required SearchCourseRequest searchCourseRequest});

  Future<DataState<List<ModuleDto>>> getModules({required int courseId});

  Future<DataState<CourseAccessDto>> getCourseAccess({required int courseId});

  Future<DataState<LessonDto>> getLesson({required int lessonId});
}
