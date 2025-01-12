part of 'course_access_bloc.dart';

abstract class CourseAccessState extends Equatable {
  const CourseAccessState();
}

class CourseAccessInitial extends CourseAccessState {
  @override
  List<Object> get props => [];
}

class CourseAccessLoading extends CourseAccessState {
  @override
  List<Object> get props => [];
}

class CourseAccessLoaded extends CourseAccessState {
  final CourseAccessDto courseAccessDto;

  const CourseAccessLoaded({
    required this.courseAccessDto,
  });

  @override
  List<Object> get props => [courseAccessDto];
}

class CourseAccessError extends CourseAccessState {
  final String message;

  const CourseAccessError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
