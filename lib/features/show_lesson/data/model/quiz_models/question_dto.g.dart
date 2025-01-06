// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
      id: (json['id'] as num?)?.toInt(),
      questionText: json['question_text'] as String,
      photo: json['photo'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_text': instance.questionText,
      'photo': instance.photo,
      'options': instance.options,
    };
