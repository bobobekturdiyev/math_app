// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_access_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseAccessDto _$CourseAccessDtoFromJson(Map<String, dynamic> json) =>
    CourseAccessDto(
      courseAccess: json['course_access'] as bool,
      lockModules: json['lock_modules'] as bool,
      moduleIds: (json['module_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CourseAccessDtoToJson(CourseAccessDto instance) =>
    <String, dynamic>{
      'course_access': instance.courseAccess,
      'lock_modules': instance.lockModules,
      'module_ids': instance.moduleIds,
    };
