part of 'course_home_bloc.dart';

abstract class CourseHomeState extends Equatable {
  const CourseHomeState();
}

class CourseHomeInitial extends CourseHomeState {
  @override
  List<Object> get props => [];
}

class CourseHomeLoading extends CourseHomeState {
  @override
  List<Object> get props => [];
}

class CourseHomeLoaded extends CourseHomeState {
  final List<CourseDto> courses;
  final bool isSearch;

  const CourseHomeLoaded({
    required this.courses,
    this.isSearch = false,
  });

  @override
  List<Object> get props => [courses, isSearch];
}

class CourseHomeError extends CourseHomeState {
  final String message;

  const CourseHomeError({required this.message});

  @override
  List<Object> get props => [message];
}
