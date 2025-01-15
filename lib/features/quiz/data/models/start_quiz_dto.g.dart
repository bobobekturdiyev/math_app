// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartQuizDto _$StartQuizDtoFromJson(Map<String, dynamic> json) => StartQuizDto(
      duration: (json['duration'] as num).toInt(),
      answers: (json['answers'] as List<dynamic>)
          .map((e) => UserQuizAnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StartQuizDtoToJson(StartQuizDto instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'answers': instance.answers,
    };
