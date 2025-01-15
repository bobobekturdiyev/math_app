part of 'test_bloc.dart';

sealed class TestState extends Equatable {
  const TestState();
}

final class TestInitial extends TestState {
  @override
  List<Object?> get props => [];
}

final class TestLoaded extends TestState {
  final List<QuestionDto> questions;
  final QuestionDto question;
  final int? selectedOptionId;
  final int? prevQuestionIndex;
  final int? nextQuestionIndex;
  final int? duration;

  const TestLoaded({
    required this.questions,
    required this.question,
    this.selectedOptionId,
    this.prevQuestionIndex,
    this.nextQuestionIndex,
    this.duration,
  });

  @override
  List<Object> get props => [question];
}

final class TestLoading extends TestState {
  const TestLoading();

  @override
  List<Object> get props => [];
}

final class QuizResultState extends TestState {
  final QuizResultDto quizResultDto;
  final List<QuestionDto> questions;
  final Map<int, int> selectedOptions;

  const QuizResultState({
    required this.quizResultDto,
    required this.questions,
    required this.selectedOptions,
  });

  @override
  List<Object> get props => [
        quizResultDto,
        questions,
        selectedOptions,
      ];
}

final class QuizResultErrorState extends TestState {
  final String message;

  const QuizResultErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [
        message,
      ];
}
