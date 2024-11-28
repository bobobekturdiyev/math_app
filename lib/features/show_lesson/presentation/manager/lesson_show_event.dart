part of 'lesson_show_bloc.dart';

@immutable
abstract class LessonShowEvent extends Equatable{
  const LessonShowEvent();

  @override
  List<Object?> get props => [];
}

class GetCourseBySlug extends LessonShowEvent{
  final String lessonSlug;

  const GetCourseBySlug({required this.lessonSlug, });

}
class LessonMarkAsWatched extends LessonShowEvent{
  final int lessonId;

  const LessonMarkAsWatched({required this.lessonId, });

}