import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/core/shared/data/shared_models/lesson/lesson_dto.dart';
import 'package:math_app/core/shared/data/shared_models/quiz/quiz_light_weight_dto.dart';


part 'course_module_dto.g.dart';

@JsonSerializable()
class CourseModuleDto {
  final int id;
  final String name;
  final int position;
  final List<LessonDto> lessons;
  final QuizLightWeightDto? quiz;

  factory CourseModuleDto.fromJson(Map<String, dynamic> json) =>
      _$CourseModuleDtoFromJson(json);

  CourseModuleDto({
    required this.id,
    required this.name,
    required this.position,
    required this.lessons,
     this.quiz,
  });

  Map<String, dynamic> toJson() => _$CourseModuleDtoToJson(this);
}
