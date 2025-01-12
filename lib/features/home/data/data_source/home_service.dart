import 'package:dio/dio.dart';
import 'package:math_app/core/resources/default_response.dart';
import 'package:math_app/core/resources/data_response.dart';
import 'package:math_app/features/home/data/model/lesson_by_course/lesson_by_course.dart';
import 'package:retrofit/retrofit.dart';


import '../../../../core/network/urls.dart';
import '../model/all_course/all_course_dto.dart';
import '../model/course_details/course_details_dto.dart';


part 'home_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

@GET('/course-all-public')
Future<HttpResponse<DefaultResponse<AllCourseDto>>> getAllCourse();
@GET('/course-detail/{slug}')
Future<HttpResponse<DataResponse<CourseDetailsDto>>> getCourseDetails({
  @Path("slug") required String slug
});

@GET('/lesson-by-course-public/{slug}')
Future<HttpResponse<DefaultResponse<LessonByCourseDto>>> getLesson({
  @Path("slug") required String slug
});



}


