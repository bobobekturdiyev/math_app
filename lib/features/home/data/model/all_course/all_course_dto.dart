import 'package:json_annotation/json_annotation.dart';

part 'all_course_dto.g.dart';

@JsonSerializable()
class AllCourseDto{
  final int id;
  final String title;
  final String slug ;
  final String excerpt ;
  @JsonKey(name: "photo_url")
  final String imageUrl ;
  final String level ;
  final String duration ;
  final int enrollments ;

  const AllCourseDto({
    required this.id,
    required this.title,
    required this.slug,
    required this.excerpt,
    required this.imageUrl,
    required this.level,
    required this.duration,
    required this.enrollments,
  });
  factory AllCourseDto.fromJson(Map<String, dynamic> json) =>
      _$AllCourseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AllCourseDtoToJson(this);
}





