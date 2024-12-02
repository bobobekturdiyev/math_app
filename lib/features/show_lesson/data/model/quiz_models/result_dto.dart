import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/question_dto.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/option_dto.dart';

part 'result_dto.g.dart';

@JsonSerializable()
class ResultDto extends QuestionDto {
  @JsonKey(name: "correct_option_id")
  final int correctOptionId;
  @JsonKey(name: "user_answer_id")
  final String userAnswerId;
  @JsonKey(name: "is_correct")
  final bool isCorrect;

  ResultDto({
    required this.correctOptionId,
    required this.userAnswerId,
    required this.isCorrect,
    required super.id,
    required super.questionText,
    required super.photo,
    required super.options,
  });

  factory ResultDto.fromJson(Map<String, dynamic> json) =>
      _$ResultDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResultDtoToJson(this);
}
