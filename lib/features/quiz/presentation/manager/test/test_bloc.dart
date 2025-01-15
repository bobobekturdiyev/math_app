import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/core/resources/question_selection_state.dart';
import 'package:math_app/features/quiz/data/models/question_dto.dart';
import 'package:math_app/features/quiz/data/models/quiz_result_dto.dart';
import 'package:math_app/features/quiz/domain/entities/choose_option_request.dart';
import 'package:math_app/features/quiz/domain/entities/quiz_complete_request.dart';
import 'package:math_app/features/quiz/domain/repositories/quiz_repo.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final List<QuestionDto> questions;
  Map<int, int> optionSelections = {};
  List<int> visitedQuestionIds = [];

  late QuestionDto question;
  int currentQuestionIndex = 0;

  QuizRepo quizRepo = locator<QuizRepo>();

  TestBloc({
    required this.questions,
  }) : super(TestInitial()) {
    on<LoadTest>((event, emit) async {
      emit(TestLoading());

      if (questions.isNotEmpty) {
        final result = await quizRepo.startQuiz(
            quizRequest: QuizCompleteRequest(quizId: questions.first.quizId));

        if (result is DataError) {
          emit(QuizResultErrorState(
              message: result.errorMessage ?? "Quizni boshlashdagi xatolik"));
        } else {
          final startQuizDto = result.data!;

          for (var answer in startQuizDto.answers) {
            _visitCheck(questionId: answer.questionId);
            optionSelections[answer.questionId] = answer.optionId;

            final questionIndex =
                questions.indexWhere((el) => el.id == answer.questionId);
            questions[questionIndex] = questions[questionIndex]
                .copyWith(state: QuestionSelectionState.selected);
          }

          final unselectedIndex = questions.indexWhere((el) =>
              el.questionSelectionState == QuestionSelectionState.unselected);
          question = questions[unselectedIndex]
              .copyWith(state: QuestionSelectionState.current);
          questions[unselectedIndex] = question;

          currentQuestionIndex = unselectedIndex;
          int? next;

          if (currentQuestionIndex + 1 != questions.length) {
            next = currentQuestionIndex + 1;
          }

          int? prev;

          if (currentQuestionIndex - 1 >= 0) {
            prev = currentQuestionIndex - 1;
          }

          emit(
            TestLoaded(
              question: question,
              questions: questions,
              nextQuestionIndex: next,
              prevQuestionIndex: prev,
              duration: startQuizDto.duration,
            ),
          );
        }
      }
    });

    on<CompleteTest>(
      (event, emit) async {
        emit(TestLoading());

        final result = await quizRepo.completeQuiz(
            quizCompleteRequest: QuizCompleteRequest(quizId: question.quizId));

        if (result is DataSuccess && result.data != null) {
          emit(
            QuizResultState(
              quizResultDto: result.data!,
              questions: questions,
              selectedOptions: optionSelections,
            ),
          );
        } else {
          emit(QuizResultErrorState(
              message: result.errorMessage ?? "Testni yakunlashdagi xatolik"));
        }
      },
    );

    on<ChooseOption>((event, emit) {
      optionSelections[event.questionId] = event.optionId;

      int questionIndex =
          questions.indexWhere((item) => item.id == event.questionId);

      question = questions[questionIndex]
          .copyWith(state: QuestionSelectionState.selected);
      questions[questionIndex] = question;

      // Serverga yuborish
      _sendOptionSelection(
          optionId: event.optionId, questionId: event.questionId);
    });

    on<SelectQuestion>((event, emit) {
      emit(TestLoading());

      // Agar eski savolga kirilgan lekin tanlanmagan bo'lsa, holatini o'zgartirish kerak
      if (visitedQuestionIds.contains(this.question.id)) {
        if (!optionSelections.containsKey(this.question.id)) {
          questions[currentQuestionIndex] =
              this.question.copyWith(state: QuestionSelectionState.skipped);
        } else {
          questions[currentQuestionIndex] =
              this.question.copyWith(state: QuestionSelectionState.selected);
        }
      }

      // Joriy savol indeksini saqlash
      currentQuestionIndex = event.index;

      // yangi savolni tanlab olish
      final question = questions[event.index];

      // keyingi va oldingi savol indekslarini olish
      int? next, previous;
      if (event.index + 1 != questions.length) {
        next = event.index + 1;
      }

      if (event.index - 1 >= 0) {
        previous = event.index - 1;
      }

      int? optionId;

      // Agar tanlangan savolga ilgari javob tanlangan bo'lsa, uni olish kerak
      if (optionSelections.containsKey(question.id)) {
        optionId = optionSelections[question.id];
      }

      _visitCheck(questionId: question.id);

      // yangi tanlangan savol holatini currentga o'tkazish

      this.question = question.copyWith(state: QuestionSelectionState.current);
      questions[event.index] = this.question;
      emit(
        TestLoaded(
          question: this.question,
          selectedOptionId: optionId,
          nextQuestionIndex: next,
          prevQuestionIndex: previous,
          questions: questions,
        ),
      );
    });
  }

  _visitCheck({required int questionId}) {
    if (!visitedQuestionIds.contains(questionId)) {
      visitedQuestionIds.add(questionId);
    }
  }

  _sendOptionSelection({
    required int optionId,
    required int questionId,
  }) async {
    final result = await quizRepo.chooseOption(
        chooseOptionRequest:
            ChooseOptionRequest(questionId: questionId, optionId: optionId));

    if (result is DataError) {
      optionSelections.remove(questionId);

      int questionIndex = questions.indexWhere((item) => item.id == questionId);

      questions[questionIndex] = questions[questionIndex]
          .copyWith(state: QuestionSelectionState.skipped);
    }
  }
}
