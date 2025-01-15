import 'package:json_annotation/json_annotation.dart';

part 'quiz_result_dto.g.dart';

@JsonSerializable()
class QuizResultDto {
  @JsonKey(name: 'total_questions')
  final int totalQuestions;
  @JsonKey(name: 'correct_answers')
  final int correctAnswers;
  @JsonKey(name: 'score_percentage')
  final int scorePercentage;

  final bool passed;

  const QuizResultDto({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.scorePercentage,
    required this.passed,
  });

  factory QuizResultDto.fromJson(Map<String, dynamic> json) =>
      _$QuizResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuizResultDtoToJson(this);
}
