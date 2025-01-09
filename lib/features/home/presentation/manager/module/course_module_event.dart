part of 'course_module_bloc.dart';

abstract class CourseModuleEvent extends Equatable {
  const CourseModuleEvent();
}

class LoadModules extends CourseModuleEvent {
  final int courseId;

  const LoadModules({required this.courseId});

  @override
  List<Object?> get props => [courseId];
}
