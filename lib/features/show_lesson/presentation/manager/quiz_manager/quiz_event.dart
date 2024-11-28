part of 'quiz_bloc.dart';

@immutable
abstract class QuizEvent {}

class GetQuizById extends QuizEvent{
  final int quizId;

  GetQuizById({required this.quizId});
}
