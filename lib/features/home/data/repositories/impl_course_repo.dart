import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/data/data_source/course_service.dart';
import 'package:math_app/features/home/data/model/course/category_dto.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/data/model/course/module_dto.dart';
import 'package:math_app/features/home/domain/entities/search_course_request.dart';

import '../../domain/repositories/course_repo.dart';

class ImplCourseRepo extends CourseRepo {
  final CourseService courseService;

  ImplCourseRepo({required this.courseService});

  @override
  Future<DataState<List<CourseDto>>> getCourses({int? categoryId}) async {
    try {
      final response = await courseService.getCourses(categoryId: categoryId);
      return DataSuccess<List<CourseDto>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<CourseDto>>(e);
    }
  }

  @override
  Future<DataState<List<CategoryDto>>> getCategories() async {
    try {
      final response = await courseService.getCategories();
      return DataSuccess<List<CategoryDto>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<CategoryDto>>(e);
    }
  }

  @override
  Future<DataState<List<CourseDto>>> searchCourse(
      {required SearchCourseRequest searchCourseRequest}) async {
    try {
      final response = await courseService.searchCourses(searchCourseRequest);
      return DataSuccess<List<CourseDto>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<CourseDto>>(e);
    }
  }

  @override
  Future<DataState<List<ModuleDto>>> getModules({required int courseId}) async {
    try {
      final response = await courseService.getCourseModules(courseId);
      return DataSuccess<List<ModuleDto>>(data: response.data);
    } catch (e) {
      return DataException.getError<List<ModuleDto>>(e);
    }
  }
}
