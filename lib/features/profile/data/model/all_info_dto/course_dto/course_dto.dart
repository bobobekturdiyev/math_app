

import 'package:json_annotation/json_annotation.dart';

part 'course_dto.g.dart';
@JsonSerializable()
class CourseDto{
  final int id;
  @JsonKey(name: "course_id")
  final int courseId;
  final String status;





  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDtoToJson(this);

  const CourseDto({
    required this.id,
    required this.courseId,
    required this.status,
  });

}