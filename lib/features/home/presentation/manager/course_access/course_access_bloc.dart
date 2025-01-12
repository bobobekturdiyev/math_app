import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/data/model/course/course_access_dto.dart';
import 'package:math_app/features/home/domain/repositories/course_repo.dart';

part 'course_access_event.dart';
part 'course_access_state.dart';

class CourseAccessBloc extends Bloc<CourseAccessEvent, CourseAccessState> {
  late CourseRepo courseRepo;

  CourseAccessBloc() : super(CourseAccessInitial()) {
    courseRepo = locator<CourseRepo>();

    on<LoadCourseAccess>((event, emit) async {
      emit(CourseAccessLoading());

      final result = await courseRepo.getCourseAccess(courseId: event.courseId);

      if (result is DataSuccess) {
        emit(CourseAccessLoaded(courseAccessDto: result.data!));
      } else {
        emit(
          CourseAccessError(
              message: result.errorMessage ?? "Course Access xatoligi"),
        );
      }
    });
  }
}
