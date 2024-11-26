import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:math_app/core/network/urls.dart';
import 'package:math_app/core/resources/default_response.dart';
import 'package:math_app/features/home/data/model/all_course/all_course_dto.dart';
import 'package:math_app/features/home/data/model/course_details/course_details_dto.dart';





part 'home_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

@GET('/courses')
Future<HttpResponse<DefaultResponse<AllCourseDto>>> getAllCourse({
    @Query('search') String? searchQuery,
    @Query('filter') String? filter,

});
@GET('/course/{slug}')
Future<HttpResponse<CourseDetailsDto>> getCourseDetails({
  @Path("slug") required String slug
});





}


