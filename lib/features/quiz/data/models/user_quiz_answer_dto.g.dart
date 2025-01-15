// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_quiz_answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserQuizAnswerDto _$UserQuizAnswerDtoFromJson(Map<String, dynamic> json) =>
    UserQuizAnswerDto(
      id: (json['id'] as num).toInt(),
      userQuizId: (json['user_quiz_id'] as num).toInt(),
      questionId: (json['question_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      optionId: (json['option_id'] as num).toInt(),
    );

Map<String, dynamic> _$UserQuizAnswerDtoToJson(UserQuizAnswerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_quiz_id': instance.userQuizId,
      'question_id': instance.questionId,
      'user_id': instance.userId,
      'option_id': instance.optionId,
    };
