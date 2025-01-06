import 'package:json_annotation/json_annotation.dart';

part 'all_course_dto.g.dart';

@JsonSerializable()
class AllCourseDto {
  final int id;
  final int price;
  final String name;
  final String slug;
  final String photo;
  final String excerpt;
  @JsonKey(name: 'discounted_price')
  final int discountedPrice;

  factory AllCourseDto.fromJson(Map<String, dynamic> json) =>
      _$AllCourseDtoFromJson(json);

  AllCourseDto({
    required this.id,
    required this.name,
    required this.slug,
    required this.photo,
    required this.price,
    required this.excerpt,
    required this.discountedPrice,
  });

  Map<String, dynamic> toJson() => _$AllCourseDtoToJson(this);
}
