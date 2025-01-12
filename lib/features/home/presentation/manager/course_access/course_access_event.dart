part of 'course_access_bloc.dart';

abstract class CourseAccessEvent extends Equatable {
  const CourseAccessEvent();
}

class LoadCourseAccess extends CourseAccessEvent {
  final int courseId;

  const LoadCourseAccess({
    required this.courseId,
  });

  @override
  List<Object?> get props => [];
}
