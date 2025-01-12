import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/domain/repositories/course_repo.dart';
import 'package:meta/meta.dart';

part 'my_course_screen_event.dart';
part 'my_course_screen_state.dart';

class MyCourseScreenBloc
    extends Bloc<MyCourseScreenEvent, MyCourseScreenState> {
  CourseRepo courseRepo = locator<CourseRepo>();

  MyCourseScreenBloc() : super(MyCourseScreenInitial()) {
    on<GetMyCourses>((event, emit) async {
      emit(MyCourseLoading());
      final result = await courseRepo.getMyCourses();
      if (result is DataSuccess) {
        emit(MyCoursesLoaded(courses: result.data ?? []));
      } else if (result is DataError) {
        emit(MyCoursesError(
            message:
                result.errorMessage ?? "Kurslarni olishda xatolik sodir bo'ldi",
            code: result.statusCode));
      }
    });
    add(GetMyCourses());
  }
}
