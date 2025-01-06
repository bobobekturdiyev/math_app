import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/core/shared/data/shared_models/course_module/course_module_dto.dart';


part 'course_dto.g.dart';

@JsonSerializable()
class CourseDto {
  final int id;
  final String name;
  final String author;
  final String slug;
  @JsonKey(name: 'is_sold')
  final bool isSold;
  final double? price;
  final String description;
  final List<CourseModuleDto> modules;
  @JsonKey(name: 'discounted_price')
  final int? discountedPrice;

  factory CourseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseDtoFromJson(json);

  CourseDto(
      {required this.id,
      required this.name,
      required this.author,
      required this.slug,
      required this.isSold,
       this.price,
      required this.description,
      required this.modules,
       this.discountedPrice});

  Map<String, dynamic> toJson() => _$CourseDtoToJson(this);
}
