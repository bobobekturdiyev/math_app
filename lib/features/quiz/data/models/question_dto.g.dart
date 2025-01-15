// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
      id: (json['id'] as num).toInt(),
      quizId: (json['quiz_id'] as num).toInt(),
      text: json['text'] as String?,
      image: json['image'] as String?,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      questionSelectionState: $enumDecodeNullable(
              _$QuestionSelectionStateEnumMap,
              json['questionSelectionState']) ??
          QuestionSelectionState.unselected,
    );

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quiz_id': instance.quizId,
      'text': instance.text,
      'image': instance.image,
      'questionSelectionState':
          _$QuestionSelectionStateEnumMap[instance.questionSelectionState]!,
      'options': instance.options,
    };

const _$QuestionSelectionStateEnumMap = {
  QuestionSelectionState.selected: 'selected',
  QuestionSelectionState.current: 'current',
  QuestionSelectionState.skipped: 'skipped',
  QuestionSelectionState.unselected: 'unselected',
};
