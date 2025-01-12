import 'package:dio/dio.dart';
import 'package:math_app/features/home/data/model/course/category_dto.dart';
import 'package:math_app/features/home/data/model/course/course_access_dto.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/data/model/course/lesson_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';
import '../../domain/entities/search_course_request.dart';
import '../model/course/module_dto.dart';

part 'course_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class CourseService {
  factory CourseService(Dio dio, {String baseUrl}) = _CourseService;

  @GET('/courses')
  Future<HttpResponse<List<CourseDto>>> getCourses(
      {@Query('category_id') int? categoryId});

  @POST('/course/search')
  Future<HttpResponse<List<CourseDto>>> searchCourses(
      @Body() SearchCourseRequest searchCourseRequest);

  @GET('/categories')
  Future<HttpResponse<List<CategoryDto>>> getCategories();

  @GET('/my-courses')
  Future<HttpResponse<List<CourseDto>>> getMyCourses(
      {@Query('state') String? state});

  @GET('/course/{id}/modules')
  Future<HttpResponse<List<ModuleDto>>> getCourseModules(
      @Path('id') int courseId);

  @GET('/course/{id}/access')
  Future<HttpResponse<CourseAccessDto>> getCourseAccess({
    @Path('id') required int courseId,
  });

  @GET('/lesson/{id}')
  Future<HttpResponse<LessonDto>> getLesson(
      {@Path('id') required int lessonId});
}
