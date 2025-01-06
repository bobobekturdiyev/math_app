// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultDto _$ResultDtoFromJson(Map<String, dynamic> json) => ResultDto(
      correctOptionId: (json['correct_option_id'] as num).toInt(),
      userAnswerId: json['user_answer_id'] as String,
      isCorrect: json['is_correct'] as bool,
      id: (json['id'] as num?)?.toInt(),
      questionText: json['question_text'] as String,
      photo: json['photo'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultDtoToJson(ResultDto instance) => <String, dynamic>{
      'id': instance.id,
      'question_text': instance.questionText,
      'photo': instance.photo,
      'options': instance.options,
      'correct_option_id': instance.correctOptionId,
      'user_answer_id': instance.userAnswerId,
      'is_correct': instance.isCorrect,
    };
