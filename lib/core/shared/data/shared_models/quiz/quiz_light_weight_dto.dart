import 'package:json_annotation/json_annotation.dart';


part 'quiz_light_weight_dto.g.dart';

@JsonSerializable()
class QuizLightWeightDto {
  final int id;
  final String title;
  @JsonKey(name: 'question_count')
  final int questionCount;


  factory QuizLightWeightDto.fromJson(Map<String, dynamic> json) =>
      _$QuizLightWeightDtoFromJson(json);

  QuizLightWeightDto({required this.id, required this.title, required this.questionCount});




  Map<String, dynamic> toJson() => _$QuizLightWeightDtoToJson(this);
}





