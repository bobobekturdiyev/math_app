part of 'my_course_screen_bloc.dart';
enum MyCourseFilter{all,in_proccess,completed}
@immutable
abstract class MyCourseScreenEvent extends Equatable {}


class GetMyCourses extends MyCourseScreenEvent{
  final MyCourseFilter filter;

  GetMyCourses({ this.filter=MyCourseFilter.all});
  @override
  List<Object?> get props => [];

}
