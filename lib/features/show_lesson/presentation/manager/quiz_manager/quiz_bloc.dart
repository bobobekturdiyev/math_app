import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/state_status.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/either_result_dto.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/quiz_dto.dart';
import 'package:math_app/features/show_lesson/domain/repositories/show_lesson_repo.dart';
import 'package:meta/meta.dart';

part 'quiz_event.dart';

part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final ShowLessonRepo showLessonRepo;
  List<bool> checkIndexList = [];
  int currentIndex = 0;
  Map<String, String?> answers = {};

  QuizBloc(this.showLessonRepo) : super(const QuizState()) {
    on<GetQuizById>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.loading));

      final result = await showLessonRepo.getQuizById(quizId: event.quizId);
      if (result is DataSuccess) {
        emit(state.copyWith(
            stateStatus: StateStatus.loaded, quizDto: result.data));
      } else {
        emit(state.copyWith(
            stateStatus: StateStatus.error,
            error: result.errorResponse?.message));
      }
    });
    on<QuizCheckEvent>((event, emit) async {
      emit(state.copyWith(checkQuizState: CheckQuizState.loading));

      final result = await showLessonRepo.checkQuiz(
          quizId: state.quizDto!.id, checkQuizBody: {"answers": answers});
      if (result is DataSuccess) {
        emit(state.copyWith(
          checkQuizState: CheckQuizState.loaded,
          resultDto: result.data

        ));
      } else {
        emit(
          state.copyWith(
            checkQuizState: CheckQuizState.error,
            error: result.errorResponse?.message,
          ),
        );
      }
    });

    on<SelectOptionEvent>((event, emit) async {
      emit(state.copyWith(stateStatus: StateStatus.normal));
      if (answers.containsKey(event.questionId)) {
        if (event.optionId != null) {
          answers[event.questionId] = event.optionId;
        }
      } else {
        answers.addAll({event.questionId: event.optionId});
      }
      emit(state.copyWith(stateStatus: StateStatus.loaded));
    });
  }
}
