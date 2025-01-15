import 'package:json_annotation/json_annotation.dart';

part 'user_quiz_answer_dto.g.dart';

@JsonSerializable()
class UserQuizAnswerDto {
  final int id;

  @JsonKey(name: 'user_quiz_id')
  final int userQuizId;

  @JsonKey(name: 'question_id')
  final int questionId;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'option_id')
  final int optionId;

  const UserQuizAnswerDto({
    required this.id,
    required this.userQuizId,
    required this.questionId,
    required this.userId,
    required this.optionId,
  });

  factory UserQuizAnswerDto.fromJson(Map<String, dynamic> json) =>
      _$UserQuizAnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserQuizAnswerDtoToJson(this);
}
