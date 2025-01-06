// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'either_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EitherResultDto _$EitherResultDtoFromJson(Map<String, dynamic> json) =>
    EitherResultDto(
      correctAnswers: (json['correct_answers'] as num).toInt(),
      totalQuestions: (json['total_questions'] as num).toInt(),
      passed: json['passed'] as bool,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => ResultDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EitherResultDtoToJson(EitherResultDto instance) =>
    <String, dynamic>{
      'correct_answers': instance.correctAnswers,
      'total_questions': instance.totalQuestions,
      'passed': instance.passed,
      'result': instance.result,
    };
