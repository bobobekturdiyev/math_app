part of 'course_details_screen_bloc.dart';

abstract class CourseDetailsScreenState extends Equatable {

 }


class CourseDetailsScreenInitial extends CourseDetailsScreenState {
  @override
  List<Object?> get props => [];
}


class CourseDetailsLoading extends CourseDetailsScreenState {
  @override
  List<Object?> get props => [];
}
class CourseDetailsLoaded extends CourseDetailsScreenState {
  final CourseDetailsEntity courseDetailsEntity;

  CourseDetailsLoaded({required this.courseDetailsEntity});

  @override
  List<Object?> get props => [ courseDetailsEntity];
}
class CourseDetailsError extends CourseDetailsScreenState {
  @override
  List<Object?> get props => [];
}


class LessonLoading extends CourseDetailsScreenState {
  @override
  List<Object?> get props => [];
}
// class LessonLoaded extends CourseDetailsScreenState {
//
//   final List<LessonByCourseDto> lesson ;
//
//   LessonLoaded({required this.lesson});
//
//   @override
//   List<Object?> get props => [ lesson];
// }
class LessonError extends CourseDetailsScreenState {
  @override
  List<Object?> get props => [];
}
