import 'package:dio/dio.dart';
import 'package:math_app/core/resources/default_response.dart';
import 'package:retrofit/retrofit.dart';


import '../../../../core/network/urls.dart';

import '../model/my_course_dto/my_course_dto.dart';


part 'my_course_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class MyCourseService {
  factory MyCourseService(Dio dio, {String baseUrl}) = _MyCourseService;

  @GET('/my-courses')
  Future<HttpResponse<DefaultResponse<MyCourseDto>>> getMyCourse();




}


