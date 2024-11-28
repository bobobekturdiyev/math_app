// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizDto _$QuizDtoFromJson(Map<String, dynamic> json) => QuizDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      questionCount: (json['question_count'] as num).toInt(),
      from: json['from'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizDtoToJson(QuizDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'question_count': instance.questionCount,
      'from': instance.from,
      'questions': instance.questions,
    };
