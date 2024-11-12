part of 'course_details_screen_bloc.dart';

@immutable
abstract class CourseDetailsScreenEvent extends Equatable {}


class GetCourseDetails extends CourseDetailsScreenEvent{
  final String slug;

  GetCourseDetails({required this.slug});
  @override
  List<Object?> get props => [];

}