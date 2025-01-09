part of 'course_home_bloc.dart';

abstract class CourseHomeEvent extends Equatable {
  const CourseHomeEvent();
}

class LoadCourses extends CourseHomeEvent {
  final int? categoryId;

  const LoadCourses({this.categoryId});

  @override
  List<Object?> get props => [];
}

class SearchCourse extends CourseHomeEvent {
  final String query;

  const SearchCourse({required this.query});

  @override
  List<Object?> get props => [query];
}
