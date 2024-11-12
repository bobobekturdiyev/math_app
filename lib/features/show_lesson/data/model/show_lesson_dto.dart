import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/show_lesson/data/model/video_dto.dart';

part 'show_lesson_dto.g.dart';

@JsonSerializable()
class ShowLessonDto{
  final int id;
  final String title;
  final String slug;
  @JsonKey(name: 'is_open')
  final String isOpen;
  final List<VideoDto> videoFiles;




  factory ShowLessonDto.fromJson(Map<String, dynamic> json) =>
      _$ShowLessonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShowLessonDtoToJson(this);

  const ShowLessonDto({
    required this.id,
    required this.title,
    required this.slug,
    required this.isOpen,
    required this.videoFiles,
  });
}





