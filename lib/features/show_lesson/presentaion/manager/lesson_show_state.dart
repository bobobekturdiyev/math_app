part of 'lesson_show_bloc.dart';

@immutable
abstract class LessonShowState extends Equatable{
  const LessonShowState();

  @override
  List<Object?> get props => [];
}

class LessonShowInitial extends LessonShowState {}

class LessonShowLoaded extends LessonShowState{
  final ShowLessonDto req;

  const LessonShowLoaded({required this.req,});

}

class LessonShowError extends LessonShowState{



}