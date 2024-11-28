import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/question_dto.dart';

part 'quiz_dto.g.dart';

@JsonSerializable()
class QuizDto {
  final int id;
  final String title;
  @JsonKey(name: 'question_count')
  final int questionCount;
  final String? from;
  final List<QuestionDto> questions;

  factory QuizDto.fromJson(Map<String, dynamic> json) =>
      _$QuizDtoFromJson(json);

  QuizDto({
    required this.id,
    required this.title,
    required this.questionCount,
    required this.from,
    required this.questions,
  });

  Map<String, dynamic> toJson() => _$QuizDtoToJson(this);
}
