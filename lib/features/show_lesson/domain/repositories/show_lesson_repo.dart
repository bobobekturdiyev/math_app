import 'package:math_app/core/shared/domain/shared_entities/course_details_entity.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/either_result_dto.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/quiz_dto.dart';

import '../../../../core/resources/data_state.dart';

abstract class ShowLessonRepo{
  Future<DataState<CourseDetailsEntity>>getLesson({required String slug});
  Future<DataState>lessonMarkAsWatch({required int  lessonId});
  Future<DataState<QuizDto>>getQuizById({required int quizId});
  Future<DataState<EitherResultDto>>checkQuiz({required int quizId, required Map<String, dynamic> checkQuizBody });
}