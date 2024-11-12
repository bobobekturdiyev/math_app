// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllInfoDto _$AllInfoDtoFromJson(Map<String, dynamic> json) => AllInfoDto(
      id: (json['id'] as num).toInt(),
      student: UserDto.fromJson(json['student'] as Map<String, dynamic>),
      education: (json['portfolio_education'] as List<dynamic>)
          .map((e) => EducationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      award: (json['portfolio_award'] as List<dynamic>)
          .map((e) => AwardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['portfolio_skills'] as List<dynamic>)
          .map((e) => SkillsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      experience: (json['portfolio_experience'] as List<dynamic>)
          .map((e) => ExperienceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: (json['portfolio_course'] as List<dynamic>?)
          ?.map((e) => CourseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllInfoDtoToJson(AllInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student': instance.student,
      'portfolio_education': instance.education,
      'portfolio_award': instance.award,
      'portfolio_skills': instance.skills,
      'portfolio_experience': instance.experience,
      'portfolio_course': instance.course,
      'languages': instance.languages,
    };
