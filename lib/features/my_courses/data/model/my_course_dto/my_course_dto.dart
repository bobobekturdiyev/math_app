import 'package:json_annotation/json_annotation.dart';

part 'my_course_dto.g.dart';

@JsonSerializable()
class MyCourseDto{
  // final int id;
  final String name;
  final String author ;
  final String duration;
  final String photo;
  final String slug;
  @JsonKey(name: 'total_lessons')
  final int totalLessons;
  @JsonKey(name: 'completed_lessons')
  final int completedLessons;
  @JsonKey(name: 'completed_percentage')
  final int completedPercentage;



  factory MyCourseDto.fromJson(Map<String, dynamic> json) =>
      _$MyCourseDtoFromJson(json);

  MyCourseDto({required this.name, required this.author, required this.duration, required this.photo, required this.slug, required this.totalLessons, required this.completedLessons, required this.completedPercentage});

  Map<String, dynamic> toJson() => _$MyCourseDtoToJson(this);


}







