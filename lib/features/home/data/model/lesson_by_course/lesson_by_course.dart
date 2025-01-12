import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/home/data/model/course/lesson_dto.dart';
part 'lesson_by_course.g.dart';

@JsonSerializable()
class LessonByCourseDto {
  final int id;
  final String name;
  final double price;
  final int? position;
  final List<LessonDto> lesson;

  factory LessonByCourseDto.fromJson(Map<String, dynamic> json) =>
      _$LessonByCourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LessonByCourseDtoToJson(this);

  const LessonByCourseDto({
    required this.id,
    required this.name,
    required this.price,
    required this.position,
    required this.lesson,
  });
}
