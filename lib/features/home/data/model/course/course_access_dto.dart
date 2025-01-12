import 'package:json_annotation/json_annotation.dart';

part 'course_access_dto.g.dart';

@JsonSerializable()
class CourseAccessDto {
  @JsonKey(name: 'course_access')
  final bool courseAccess;

  @JsonKey(name: 'lock_modules')
  final bool lockModules;

  @JsonKey(name: 'module_ids')
  final List<int> moduleIds;

  const CourseAccessDto({
    required this.courseAccess,
    required this.lockModules,
    required this.moduleIds,
  });

  factory CourseAccessDto.fromJson(Map<String, dynamic> json) =>
      _$CourseAccessDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourseAccessDtoToJson(this);
}
