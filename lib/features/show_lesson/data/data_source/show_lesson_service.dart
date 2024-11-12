import 'package:dio/dio.dart';
import 'package:math_app/core/resources/data_response.dart';
import 'package:math_app/features/show_lesson/data/model/show_lesson_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';




part 'show_lesson_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ShowLessonService {
  factory ShowLessonService(Dio dio, {String baseUrl}) = _ShowLessonService;



  @GET('/lesson-show-public/{slug}')
  Future<HttpResponse<DataResponse<ShowLessonDto>>> getLesson({
    @Path("slug") required String slug
  });



}


