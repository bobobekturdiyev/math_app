
import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/show_lesson/data/model/quiz_models/result_dto.dart';


part 'either_result_dto.g.dart';

@JsonSerializable()
class EitherResultDto {
@JsonKey(name: 'correct_answers')
final int correctAnswers;
@JsonKey(name: 'total_questions')
final int totalQuestions;
final bool passed;
final List<ResultDto>? result;
  factory EitherResultDto.fromJson(Map<String, dynamic> json) =>
      _$EitherResultDtoFromJson(json);

  EitherResultDto({required this.correctAnswers, required this.totalQuestions, required this.passed,  this.result});





  Map<String, dynamic> toJson() => _$EitherResultDtoToJson(this);
}

