import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/data_state.dart';
import 'package:math_app/features/home/data/model/course/course_dto.dart';
import 'package:math_app/features/home/domain/entities/search_course_request.dart';
import 'package:math_app/features/home/domain/repositories/course_repo.dart';

part 'course_home_event.dart';
part 'course_home_state.dart';

class CourseHomeBloc extends Bloc<CourseHomeEvent, CourseHomeState> {
  late CourseRepo courseRepo;
  List<CourseDto> courses = [];

  CourseHomeBloc() : super(CourseHomeInitial()) {
    courseRepo = locator<CourseRepo>();

    on<LoadCourses>((event, emit) async {
      emit(CourseHomeLoading());

      final result = await courseRepo.getCourses(categoryId: event.categoryId);

      if (result is DataSuccess) {
        courses = result.data!;
        emit(CourseHomeLoaded(courses: courses, isSearch: false));
      } else {
        emit(CourseHomeError(
            message:
                result.errorMessage ?? 'Kursni olishda nimadir xato ketdi'));
      }
    });

    on<SearchCourse>((event, emit) async {
      emit(CourseHomeLoading());

      final result = await courseRepo.searchCourse(
          searchCourseRequest: SearchCourseRequest(query: event.query));

      if (result is DataSuccess) {
        courses = result.data!;
        emit(CourseHomeLoaded(courses: courses, isSearch: true));
      } else {
        emit(
          CourseHomeError(
            message: result.errorMessage ?? 'Kursni olishda nimadir xato ketdi',
          ),
        );
      }
    });

    add(const LoadCourses());
  }
}
