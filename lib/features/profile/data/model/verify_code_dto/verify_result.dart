

import 'package:json_annotation/json_annotation.dart';



part 'verify_result.g.dart';
@JsonSerializable()
class VerifyResult{
  final bool sent;
  final String phone;
  final int wait;



  factory VerifyResult.fromJson(Map<String, dynamic> json) =>
      _$VerifyResultFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResultToJson(this);

  const VerifyResult({
    required this.sent,
    required this.phone,
    required this.wait,
  });
}