import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/core/resources/question_selection_state.dart';
import 'package:math_app/features/quiz/data/models/option_dto.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  final int id;
  @JsonKey(name: 'quiz_id')
  final int quizId;
  final String? text;
  final String? image;
  final QuestionSelectionState questionSelectionState;

  final List<OptionDto> options;

  const QuestionDto({
    required this.id,
    required this.quizId,
    this.text,
    this.image,
    required this.options,
    this.questionSelectionState = QuestionSelectionState.unselected,
  });

  QuestionDto copyWith({required QuestionSelectionState state}) => QuestionDto(
        id: id,
        quizId: quizId,
        options: options,
        text: text,
        image: image,
        questionSelectionState: state,
      );

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);
}
