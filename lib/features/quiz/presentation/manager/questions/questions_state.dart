part of 'questions_bloc.dart';

sealed class QuestionsState extends Equatable {
  const QuestionsState();
}

final class QuestionsInitial extends QuestionsState {
  @override
  List<Object> get props => [];
}

final class QuestionsLoading extends QuestionsState {
  @override
  List<Object> get props => [];
}

final class QuestionsLoaded extends QuestionsState {
  final List<QuestionDto> questions;

  const QuestionsLoaded({
    required this.questions,
  });

  @override
  List<Object> get props => [questions];
}

final class QuestionsError extends QuestionsState {
  final String message;

  const QuestionsError({required this.message});

  @override
  List<Object> get props => [message];
}
