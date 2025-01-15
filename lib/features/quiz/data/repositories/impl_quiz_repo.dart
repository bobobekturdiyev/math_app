import 'package:math_app/features/quiz/data/models/question_dto.dart';
import 'package:math_app/features/quiz/data/models/quiz_result_dto.dart';
import 'package:math_app/features/quiz/data/models/user_quiz_answer_dto.dart';
import 'package:math_app/features/quiz/domain/entities/choose_option_request.dart';
import 'package:math_app/features/quiz/domain/entities/quiz_complete_request.dart';
import 'package:math_app/features/quiz/domain/repositories/quiz_repo.dart';

import '../../../../core/error/exception_handler.dart';
import '../../../../core/resources/data_state.dart';
import '../data_sources/quiz_service.dart';
import '../models/start_quiz_dto.dart';

class ImplQuizRepo extends QuizRepo {
  final QuizService quizService;

  ImplQuizRepo({
    required this.quizService,
  });

  @override
  Future<DataState<List<QuestionDto>>> getQuestions(
      {required int quizId}) async {
    try {
      final result = await quizService.getQuestions(quizId: quizId);

      return DataSuccess<List<QuestionDto>>(data: result.data);
    } catch (e) {
      return DataException.getError<List<QuestionDto>>(e);
    }
  }

  @override
  Future<DataState<UserQuizAnswerDto>> chooseOption(
      {required ChooseOptionRequest chooseOptionRequest}) async {
    try {
      final result = await quizService.chooseOption(
          chooseOptionRequest: chooseOptionRequest);

      return DataSuccess<UserQuizAnswerDto>(data: result.data);
    } catch (e) {
      return DataException.getError<UserQuizAnswerDto>(e);
    }
  }

  @override
  Future<DataState<QuizResultDto>> completeQuiz(
      {required QuizCompleteRequest quizCompleteRequest}) async {
    try {
      final result = await quizService.quizComplete(
          quizCompleteRequest: quizCompleteRequest);

      return DataSuccess<QuizResultDto>(data: result.data);
    } catch (e) {
      return DataException.getError<QuizResultDto>(e);
    }
  }

  @override
  Future<DataState<StartQuizDto>> startQuiz(
      {required QuizCompleteRequest quizRequest}) async {
    try {
      final result = await quizService.quizStart(quizRequest: quizRequest);

      return DataSuccess<StartQuizDto>(data: result.data);
    } catch (e) {
      return DataException.getError<StartQuizDto>(e);
    }
  }
}
