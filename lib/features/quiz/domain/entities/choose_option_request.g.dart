// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_option_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChooseOptionRequest _$ChooseOptionRequestFromJson(Map<String, dynamic> json) =>
    ChooseOptionRequest(
      questionId: (json['question_id'] as num).toInt(),
      optionId: (json['option_id'] as num).toInt(),
    );

Map<String, dynamic> _$ChooseOptionRequestToJson(
        ChooseOptionRequest instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'option_id': instance.optionId,
    };
