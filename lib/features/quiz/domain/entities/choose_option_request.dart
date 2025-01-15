import 'package:json_annotation/json_annotation.dart';

part 'choose_option_request.g.dart';

@JsonSerializable()
class ChooseOptionRequest {
  @JsonKey(name: 'question_id')
  final int questionId;

  @JsonKey(name: 'option_id')
  final int optionId;

  const ChooseOptionRequest({
    required this.questionId,
    required this.optionId,
  });

  factory ChooseOptionRequest.fromJson(Map<String, dynamic> json) =>
      _$ChooseOptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChooseOptionRequestToJson(this);
}
