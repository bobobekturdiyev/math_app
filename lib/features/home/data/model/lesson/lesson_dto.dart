import 'package:json_annotation/json_annotation.dart';

part 'lesson_dto.g.dart';


@JsonSerializable()
class LessonDto{
  final int id;
  final String title;
  final String slug;
  final int? price;
  final int? position;
  @JsonKey(name: 'is_open')
  final String isOpen;
  @JsonKey(name:"lesson_join_category_id" )
  final int? lessonJoinCategoryId;

  factory LessonDto.fromJson(Map<String, dynamic> json) =>
      _$LessonDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LessonDtoToJson(this);

  const LessonDto( {
    required this.id,
    required this.title,
    required this.isOpen,
    required this.slug,
    required this.price,
    required this.position,
    required this.lessonJoinCategoryId,
  });
}





