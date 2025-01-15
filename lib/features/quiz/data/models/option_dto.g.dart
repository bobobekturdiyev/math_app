// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionDto _$OptionDtoFromJson(Map<String, dynamic> json) => OptionDto(
      id: (json['id'] as num).toInt(),
      questionId: (json['question_id'] as num).toInt(),
      text: json['text'] as String?,
      image: json['image'] as String?,
      isCorrect: json['is_correct'] as bool,
    );

Map<String, dynamic> _$OptionDtoToJson(OptionDto instance) => <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'text': instance.text,
      'image': instance.image,
      'is_correct': instance.isCorrect,
    };
