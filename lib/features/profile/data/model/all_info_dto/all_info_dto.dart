

import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/award_dto/award_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/course_dto/course_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/experience_dto/experience_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/language_dto/language_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/skills_dto/skills_dto.dart';
import 'package:math_app/features/profile/data/model/all_info_dto/user_dto/user_dto.dart';

import 'education_dto/education_dto.dart';

part 'all_info_dto.g.dart';
@JsonSerializable()
class AllInfoDto{
  final int id;
  final UserDto student;
  @JsonKey(name: "portfolio_education")
  final List<EducationDto> education;
  @JsonKey(name: "portfolio_award")
  final List<AwardDto> award;
  @JsonKey(name: "portfolio_skills")
  final List<SkillsDto> skills;
  @JsonKey(name: "portfolio_experience")
  final List<ExperienceDto> experience;
  @JsonKey(name: "portfolio_course")
  final List<CourseDto>? course;
  final List<LanguageDto>? languages;





  factory AllInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AllInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AllInfoDtoToJson(this);

  const AllInfoDto({
    required this.id,
    required this.student,
    required this.education,
    required this.award,
    required this.skills,
    required this.experience,
    required this.course,
    required this.languages,
  });
}