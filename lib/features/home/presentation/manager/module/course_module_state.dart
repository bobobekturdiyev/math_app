part of 'course_module_bloc.dart';

abstract class CourseModuleState extends Equatable {
  const CourseModuleState();
}

class CourseModuleInitial extends CourseModuleState {
  @override
  List<Object> get props => [];
}

class CourseModuleLoading extends CourseModuleState {
  @override
  List<Object> get props => [];
}

class CourseModuleLoaded extends CourseModuleState {
  final List<ModuleDto> modules;

  const CourseModuleLoaded({
    required this.modules,
  });

  @override
  List<Object> get props => [
        modules,
      ];
}

class CourseModuleError extends CourseModuleState {
  final String message;

  const CourseModuleError({required this.message});

  @override
  List<Object> get props => [message];
}
