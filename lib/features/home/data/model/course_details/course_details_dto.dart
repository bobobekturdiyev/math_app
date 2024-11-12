import 'package:json_annotation/json_annotation.dart';

part 'course_details_dto.g.dart';


@JsonSerializable()
class CourseDetailsDto{
  final int id;
  final String title;
  @JsonKey(name: "has_access")


  final bool? hasAccess;
  final String slug ;
  final String excerpt ;
  final String description ;
  @JsonKey(name: "photo_url")
  final String imageUrl ;
  final String trailer ;
  final String level ;
  final String duration ;
  final int enrollments ;
  @JsonKey(name: "lessons_number")
  final int lessonNumber ;
  const CourseDetailsDto({
    required this.id,
    required this.title,
     this.hasAccess=false,
    required this.slug,
    required this.excerpt,
    required this.description,
    required this.imageUrl,
    required this.trailer,
    required this.level,
    required this.duration,
    required this.enrollments,
    required this.lessonNumber,
  });

  factory CourseDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseDetailsDtoToJson(this);


}





