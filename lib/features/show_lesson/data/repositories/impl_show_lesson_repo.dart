import 'package:math_app/core/error/exception_handler.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/shared/data/shared_mapper/shared_mapper.dart';
import 'package:math_app/core/shared/domain/shared_entities/course_details_entity.dart';
import 'package:math_app/features/show_lesson/data/data_source/show_lesson_service.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/either_result_dto.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/quiz_dto.dart';
import 'package:math_app/features/show_lesson/domain/repositories/show_lesson_repo.dart';

class ImplShowLessonRepo extends ShowLessonRepo{
 final ShowLessonService service;

  ImplShowLessonRepo({required this.service});
  SharedMapper _sharedMapper=SharedMapper();

  @override
  Future<DataState<CourseDetailsEntity>> getLesson({required String slug})async {
    try{
      final response=await service.getLesson(slug: slug);
      return DataSuccess<CourseDetailsEntity>(data: _sharedMapper.getCourseDetailsDtoToEntity(response.data));
    }catch(e){
      print(e);
      return DataException.getError<CourseDetailsEntity>(e);
    }
  }

  @override
  Future<DataState<QuizDto>> getQuizById({required int quizId}) async {
    try{
      final response=await service.getQuizById(id: quizId);
      return DataSuccess<QuizDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<QuizDto>(e);
    }
  }

  @override
  Future<DataState> lessonMarkAsWatch({required int lessonId}) async {
    try{
      final response=await service.getQuizById(id: lessonId);
      return DataSuccess(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError(e);
    }
  }

  @override
  Future<DataState<EitherResultDto>> checkQuiz({required int quizId, required Map<String, dynamic> checkQuizBody}) async {
    try{
      final response=await service.quizCheckRoute(quizId: quizId,quizCheckBody: checkQuizBody);
      return DataSuccess<EitherResultDto>(data: response.data);
    }catch(e){
      print(e);
      return DataException.getError<EitherResultDto>(e);
    }
  }
}