part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class GetQuizById extends QuizEvent{
  final int quizId;

  GetQuizById({required this.quizId});
}


class SelectOptionEvent extends QuizEvent{
  final String questionId;
  final String? optionId;

  SelectOptionEvent({required this.questionId,  this.optionId});

}

class QuizCheckEvent extends QuizEvent{

}
