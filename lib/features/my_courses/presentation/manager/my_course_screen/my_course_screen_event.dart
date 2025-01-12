part of 'my_course_screen_bloc.dart';

abstract class MyCourseScreenEvent extends Equatable {}

class GetMyCourses extends MyCourseScreenEvent {
  final String? state;

  GetMyCourses({
    this.state,
  });

  @override
  List<Object?> get props => [];
}
