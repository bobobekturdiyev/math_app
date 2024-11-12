part of 'lesson_show_bloc.dart';

@immutable
abstract class LessonShowEvent extends Equatable{
  const LessonShowEvent();

  @override
  List<Object?> get props => [];
}

class LoadingLessonShow extends LessonShowEvent{
  final String lessonSlug;

  const LoadingLessonShow({required this.lessonSlug, });

}