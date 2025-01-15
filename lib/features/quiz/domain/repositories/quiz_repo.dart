import 'package:math_app/features/quiz/data/models/question_dto.dart';
import 'package:math_app/features/quiz/data/models/quiz_result_dto.dart';
import 'package:math_app/features/quiz/data/models/user_quiz_answer_dto.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/models/start_quiz_dto.dart';
import '../entities/choose_option_request.dart';
import '../entities/quiz_complete_request.dart';

abstract class QuizRepo {
  Future<DataState<List<QuestionDto>>> getQuestions({required int quizId});

  Future<DataState<UserQuizAnswerDto>> chooseOption(
      {required ChooseOptionRequest chooseOptionRequest});

  Future<DataState<QuizResultDto>> completeQuiz({
    required QuizCompleteRequest quizCompleteRequest,
  });

  Future<DataState<StartQuizDto>> startQuiz({
    required QuizCompleteRequest quizRequest,
  });
}
