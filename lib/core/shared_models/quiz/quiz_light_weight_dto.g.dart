// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_light_weight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizLightWeightDto _$QuizLightWeightDtoFromJson(Map<String, dynamic> json) =>
    QuizLightWeightDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      questionCount: (json['question_count'] as num).toInt(),
    );

Map<String, dynamic> _$QuizLightWeightDtoToJson(QuizLightWeightDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'question_count': instance.questionCount,
    };
