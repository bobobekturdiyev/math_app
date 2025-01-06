part of 'quiz_bloc.dart';

enum CheckQuizState{ loading,loaded, normal, success, error}

@immutable
class QuizState extends Equatable {
  final StateStatus stateStatus;
  final CheckQuizState checkQuizState;
  final int currentIndex;
  final QuizDto? quizDto;
  final EitherResultDto? resultDto;
  final String? error;

  const QuizState({
    this.stateStatus = StateStatus.normal,
    this.checkQuizState = CheckQuizState.normal,
    this.currentIndex=0,
    this.quizDto,
    this.resultDto,
    this.error,
  });

  QuizState copyWith({
    StateStatus? stateStatus,
    CheckQuizState? checkQuizState,
    QuizDto? quizDto,
    EitherResultDto? resultDto,
    int? currentIndex,
    String? error,
  }) =>
      QuizState(
        quizDto: quizDto??this.quizDto,
        resultDto: resultDto??this.resultDto,
        currentIndex: currentIndex??this.currentIndex,
        error: error,
        stateStatus: stateStatus ?? this.stateStatus,
        checkQuizState: checkQuizState ?? this.checkQuizState,


      );

  @override
  List<Object?> get props => [error,stateStatus,quizDto,currentIndex,checkQuizState,resultDto];
}
