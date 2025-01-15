// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizResultDto _$QuizResultDtoFromJson(Map<String, dynamic> json) =>
    QuizResultDto(
      totalQuestions: (json['total_questions'] as num).toInt(),
      correctAnswers: (json['correct_answers'] as num).toInt(),
      scorePercentage: (json['score_percentage'] as num).toInt(),
      passed: json['passed'] as bool,
    );

Map<String, dynamic> _$QuizResultDtoToJson(QuizResultDto instance) =>
    <String, dynamic>{
      'total_questions': instance.totalQuestions,
      'correct_answers': instance.correctAnswers,
      'score_percentage': instance.scorePercentage,
      'passed': instance.passed,
    };
