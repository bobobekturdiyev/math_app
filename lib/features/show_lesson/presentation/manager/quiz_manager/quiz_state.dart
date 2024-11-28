part of 'quiz_bloc.dart';

@immutable
class QuizState extends Equatable {
  final StateStatus stateStatus;
  final QuizDto? quizDto;
  final String? error;

  const QuizState({
    this.stateStatus = StateStatus.normal,
    this.quizDto,
    this.error,
  });

  QuizState copyWith({
    StateStatus? stateStatus,
    QuizDto? quizDto,
    String? error,
  }) =>
      QuizState(
        quizDto: quizDto??this.quizDto,
        error: error,
        stateStatus: stateStatus ?? this.stateStatus,


      );

  @override
  List<Object?> get props => [error,stateStatus,quizDto];
}
