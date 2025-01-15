import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/quiz/data/models/user_quiz_answer_dto.dart';

part 'start_quiz_dto.g.dart';

@JsonSerializable()
class StartQuizDto {
  final int duration;
  final List<UserQuizAnswerDto> answers;

  const StartQuizDto({
    required this.duration,
    required this.answers,
  });

  factory StartQuizDto.fromJson(Map<String, dynamic> json) =>
      _$StartQuizDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StartQuizDtoToJson(this);
}
