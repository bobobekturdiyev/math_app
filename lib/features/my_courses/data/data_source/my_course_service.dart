import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';

import '../model/my_course_dto/my_course_dto.dart';

part 'my_course_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class MyCourseService {
  factory MyCourseService(Dio dio, {String baseUrl}) = _MyCourseService;

  @GET('/my-courses')
  Future<HttpResponse<List<MyCourseDto>>> getMyCourse({
    @Query('filter') required String filter,
  });
}
