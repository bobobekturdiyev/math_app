import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/data/model/course/lesson_dto.dart';
import 'package:math_app/features/home/domain/repositories/course_repo.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  late CourseRepo courseRepo;
  LessonDto? lessonDto;

  LessonBloc() : super(LessonInitial()) {
    courseRepo = locator<CourseRepo>();
    on<LoadLesson>(
      (event, emit) async {
        emit(LessonLoading());

        final result = await courseRepo.getLesson(lessonId: event.lessonId);

        if (result is DataSuccess) {
          lessonDto = result.data;
          emit(LessonLoaded(lessonDto: result.data!));
        } else {
          emit(
            LessonError(
              message:
                  result.errorMessage ?? "Darsni olishda nimadir xato ketdi",
            ),
          );
        }
      },
    );

    on<SelectVideo>(
      (event, emit) async {
        if (lessonDto != null) {
          emit(LessonLoading());
          emit(LessonLoaded(
              lessonDto: lessonDto!, activeVideoIndex: event.videoIndex));
        }
      },
    );
  }
}
