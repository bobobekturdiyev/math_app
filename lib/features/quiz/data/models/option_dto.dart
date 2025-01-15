import 'package:json_annotation/json_annotation.dart';

part 'option_dto.g.dart';

@JsonSerializable()
class OptionDto {
  final int id;
  @JsonKey(name: 'question_id')
  final int questionId;
  final String? text;
  final String? image;
  @JsonKey(name: 'is_correct')
  final bool isCorrect;

  const OptionDto({
    required this.id,
    required this.questionId,
    this.text,
    this.image,
    required this.isCorrect,
  });

  factory OptionDto.fromJson(Map<String, dynamic> json) =>
      _$OptionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OptionDtoToJson(this);
}
