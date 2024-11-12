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
  final List<MyCourseDto> myCourses;

  MyCoursesLoaded({required this.myCourses});
  @override
  List<Object?> get props => [myCourses];
}
class MyCoursesError extends MyCourseScreenState {
  @override
  List<Object?> get props => [];
}

class NoAuth extends MyCourseScreenState {
  @override
  List<Object?> get props => [];
}
