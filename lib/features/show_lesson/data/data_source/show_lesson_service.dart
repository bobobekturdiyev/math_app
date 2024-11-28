import 'package:dio/dio.dart';
import 'package:math_app/core/shared_models/course_model/course_dto.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/quiz_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';




part 'show_lesson_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class ShowLessonService {
  factory ShowLessonService(Dio dio, {String baseUrl}) = _ShowLessonService;



  @GET('/course/{slug}')
  Future<HttpResponse<CourseDto>> getLesson({
    @Path("slug") required String slug
  });
  @GET('/quiz/{id}')
  Future<HttpResponse<QuizDto>> getQuizById({
    @Path("id") required int id
  });
  @POST('/lesson/{id}/watch')
  Future<HttpResponse> lessonMarkAsWatch({
    @Path("id") required int id
  });



}


