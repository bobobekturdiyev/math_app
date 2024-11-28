import 'package:math_app/core/shared_entities/lesson_entity.dart';

class ModuleEntity {
  final int id;
  final String name;
  final int position;
  final List<LessonEntity> lessons;
  final int quizId;

  ModuleEntity(
      {required this.id,
      required this.name,
      required this.position,
      required this.lessons,
       required this.quizId,
      });
}
