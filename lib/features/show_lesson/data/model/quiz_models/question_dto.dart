
import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/option_dto.dart';


part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  final int? id;
  @JsonKey(name: 'question_text')
  final String questionText;
  final String photo;
  final List<OptionDto> options;

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  QuestionDto({ this.id, required this.questionText, required this.photo, required this.options});




  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);
}


