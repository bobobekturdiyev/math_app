part of 'my_course_screen_bloc.dart';

@immutable
abstract class MyCourseScreenState extends Equatable {}

class MyCourseScreenInitial extends MyCourseScreenState {
  @override
  List<Object?> get props => [];
}

class MyCourseLoading extends MyCourseScreenState {
  @override
  List<Object?> get props => [];
}

class MyCoursesLoaded extends MyCourseScreenState {
  final List<CourseDto> courses;

  MyCoursesLoaded({required this.courses});

  @override
  List<Object?> get props => [courses];
}

class MyCoursesError extends MyCourseScreenState {
  final String message;
  final int? code;

  MyCoursesError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message];
}

class NoAuth extends MyCourseScreenState {
  @override
  List<Object?> get props => [];
}
