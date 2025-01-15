part of 'questions_bloc.dart';

sealed class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class LoadQuestions extends QuestionsEvent {
  final int quizId;

  const LoadQuestions({required this.quizId});

  @override
  List<Object?> get props => [quizId];
}
