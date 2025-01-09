import 'package:math_app/features/home/data/model/course/category_dto.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/data/model/course/module_dto.dart';
import 'package:math_app/features/home/domain/entities/search_course_request.dart';

import '../../../../core/resources/data_state.dart';

abstract class CourseRepo {
  Future<DataState<List<CourseDto>>> getCourses({int? categoryId});

  Future<DataState<List<CategoryDto>>> getCategories();

  Future<DataState<List<CourseDto>>> searchCourse(
      {required SearchCourseRequest searchCourseRequest});

  Future<DataState<List<ModuleDto>>> getModules({required int courseId});
}
