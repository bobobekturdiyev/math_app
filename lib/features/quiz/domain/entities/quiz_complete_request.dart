import 'package:json_annotation/json_annotation.dart';

part 'quiz_complete_request.g.dart';

@JsonSerializable()
class QuizCompleteRequest {
  @JsonKey(name: 'quiz_id')
  final int quizId;

  const QuizCompleteRequest({
    required this.quizId,
  });

  factory QuizCompleteRequest.fromJson(Map<String, dynamic> json) =>
      _$QuizCompleteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QuizCompleteRequestToJson(this);
}
