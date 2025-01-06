import 'package:json_annotation/json_annotation.dart';

part 'lesson_dto.g.dart';


@JsonSerializable()
class LessonDto {
  final int id;
  final String title;
  final String duration;
  @JsonKey(name: 'has_access')
  final int hasAccess;
  @JsonKey(name: 'is_watched')
  final bool isWatched;
  @JsonKey(name: 'video')
  final String? videoUrl;

  factory LessonDto.fromJson(Map<String, dynamic> json) =>
      _$LessonDtoFromJson(json);

  LessonDto(
      {required this.id, required this.title, required this.duration, required this.hasAccess, required this.isWatched,  this.videoUrl});

  Map<String, dynamic> toJson() => _$LessonDtoToJson(this);


}





