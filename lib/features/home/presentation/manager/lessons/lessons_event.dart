part of 'lessons_bloc.dart';

@immutable
abstract class LessonsEvent extends Equatable {}

class GetLessons extends LessonsEvent {
  final String slug;

  GetLessons({required this.slug});

  @override
  List<Object?> get props => [];
}
