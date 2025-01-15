// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_complete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizCompleteRequest _$QuizCompleteRequestFromJson(Map<String, dynamic> json) =>
    QuizCompleteRequest(
      quizId: (json['quiz_id'] as num).toInt(),
    );

Map<String, dynamic> _$QuizCompleteRequestToJson(
        QuizCompleteRequest instance) =>
    <String, dynamic>{
      'quiz_id': instance.quizId,
    };
