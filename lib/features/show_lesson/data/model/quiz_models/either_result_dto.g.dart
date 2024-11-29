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
    );

Map<String, dynamic> _$EitherResultDtoToJson(EitherResultDto instance) =>
    <String, dynamic>{
      'correct_answers': instance.correctAnswers,
      'total_questions': instance.totalQuestions,
      'passed': instance.passed,
    };
