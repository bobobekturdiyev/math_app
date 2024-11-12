part of 'lessons_bloc.dart';

@immutable
abstract class LessonsState extends Equatable {}

class LessonsInitial extends LessonsState {
  @override
  List<Object?> get props => [];
}
class LessonsLoading extends LessonsState {
  @override
  List<Object?> get props => [];
}
class LessonsLoaded extends LessonsState {

  final List<LessonByCourseDto> lessons;
  final bool isLogin;

  LessonsLoaded( {required this.lessons,required this.isLogin});
  @override
  List<Object?> get props => [ lessons];

}
class LessonsError extends LessonsState {
  @override
  List<Object?> get props => [];
}
