part of 'lesson_bloc.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();
}

class LoadLesson extends LessonEvent {
  final int lessonId;

  const LoadLesson({required this.lessonId});

  @override
  List<Object?> get props => [lessonId];
}

class SelectVideo extends LessonEvent {
  final int videoIndex;

  const SelectVideo({required this.videoIndex});

  @override
  List<Object?> get props => [videoIndex];
}
