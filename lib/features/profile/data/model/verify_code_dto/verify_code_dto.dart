

import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/profile/data/model/verify_code_dto/verify_result.dart';



part 'verify_code_dto.g.dart';
@JsonSerializable()
class VerifyCodeDto{
  final VerifyResult result;



  factory VerifyCodeDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeDtoToJson(this);

  const VerifyCodeDto({
    required this.result,
  });
}