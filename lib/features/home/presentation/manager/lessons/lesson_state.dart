part of 'lesson_bloc.dart';

abstract class LessonState extends Equatable {
  const LessonState();
}

class LessonInitial extends LessonState {
  @override
  List<Object> get props => [];
}

class LessonLoading extends LessonState {
  @override
  List<Object?> get props => [];
}

class LessonLoaded extends LessonState {
  final LessonDto lessonDto;
  final int activeVideoIndex;

  const LessonLoaded({
    required this.lessonDto,
    this.activeVideoIndex = 0,
  });

  @override
  List<Object?> get props => [lessonDto, activeVideoIndex];
}

class LessonError extends LessonState {
  final String message;

  const LessonError({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
