part of 'lesson_show_bloc.dart';

@immutable
abstract class LessonShowState extends Equatable{
  const LessonShowState();

  @override
  List<Object?> get props => [];
}

class LessonShowInitial extends LessonShowState {}

class LessonShowLoaded extends LessonShowState{
  final CourseDetailsEntity courseEntity;

  const LessonShowLoaded({required this.courseEntity,});

}

class LessonShowError extends LessonShowState{



}