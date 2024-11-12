

import 'package:json_annotation/json_annotation.dart';


part 'language_dto.g.dart';
@JsonSerializable()
class LanguageDto{
  final int id;
  @JsonKey(name: "student_id")
  final int studentId;
  @JsonKey(name: "language_name")
  final String language;
  final String level;






  factory LanguageDto.fromJson(Map<String, dynamic> json) =>
      _$LanguageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDtoToJson(this);

  const LanguageDto({
    required this.id,
    required this.studentId,
    required this.language,
    required this.level,
  });
}