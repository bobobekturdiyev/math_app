import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/quiz/data/models/question_dto.dart';
import 'package:math_app/features/quiz/domain/repositories/quiz_repo.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final QuizRepo quizRepo = locator<QuizRepo>();

  QuestionsBloc() : super(QuestionsInitial()) {
    on<LoadQuestions>((event, emit) async {
      emit(QuestionsLoading());
      final result = await quizRepo.getQuestions(quizId: event.quizId);

      if (result is DataSuccess && result.data != null) {
        emit(QuestionsLoaded(questions: result.data!));
      } else {
        emit(QuestionsError(
            message: result.errorMessage ?? "Savollarni olishda xatolik"));
      }
    });
  }
}
