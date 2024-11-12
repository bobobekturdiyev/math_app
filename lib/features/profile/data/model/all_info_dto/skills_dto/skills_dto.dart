


import 'package:json_annotation/json_annotation.dart';

part 'skills_dto.g.dart';
@JsonSerializable()
class SkillsDto{
final int id;
final String name;




factory SkillsDto.fromJson(Map<String, dynamic> json) =>
_$SkillsDtoFromJson(json);

Map<String, dynamic> toJson() => _$SkillsDtoToJson(this);

const SkillsDto({
    required this.id,
    required this.name,
  });
}