import 'package:dio/dio.dart';
import 'package:math_app/features/quiz/data/models/question_dto.dart';
import 'package:math_app/features/quiz/data/models/quiz_result_dto.dart';
import 'package:math_app/features/quiz/data/models/start_quiz_dto.dart';
import 'package:math_app/features/quiz/data/models/user_quiz_answer_dto.dart';
import 'package:math_app/features/quiz/domain/entities/quiz_complete_request.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/urls.dart';
import '../../domain/entities/choose_option_request.dart';

part 'quiz_service.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class QuizService {
  factory QuizService(Dio dio, {String baseUrl}) = _QuizService;

  @GET('/quiz/{id}/questions')
  Future<HttpResponse<List<QuestionDto>>> getQuestions(
      {@Path('id') required int quizId});

  @POST('/quiz/choose-option')
  Future<HttpResponse<UserQuizAnswerDto>> chooseOption({
    @Body() required ChooseOptionRequest chooseOptionRequest,
  });

  @POST('/quiz/complete')
  Future<HttpResponse<QuizResultDto>> quizComplete({
    @Body() required QuizCompleteRequest quizCompleteRequest,
  });

  @POST('/quiz/start')
  Future<HttpResponse<StartQuizDto>> quizStart({
    @Body() required QuizCompleteRequest quizRequest,
  });
}
