import 'package:json_annotation/json_annotation.dart';

part 'my_course_dto.g.dart';

@JsonSerializable()
class MyCourseDto{
  final int id;
  final String title;
  final String slug ;
  final String excerpt;
  @JsonKey(name: "photo_url")
  final String imageUrl;
  final String level;
  final String duration;
  final int enrollments;
  final bool hasAccess;



  factory MyCourseDto.fromJson(Map<String, dynamic> json) =>
      _$MyCourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MyCourseDtoToJson(this);

  const MyCourseDto({
    required this.id,
    required this.title,
    required this.slug,
    required this.excerpt,
    required this.imageUrl,
    required this.level,
    required this.duration,
    required this.enrollments,
    required this.hasAccess,
  });
}





