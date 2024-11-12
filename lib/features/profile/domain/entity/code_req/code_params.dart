

import 'package:json_annotation/json_annotation.dart';



part 'code_params.g.dart';
@JsonSerializable()
class CodeParams{
  final String token;
  final String code;



  factory CodeParams.fromJson(Map<String, dynamic> json) =>
      _$CodeParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CodeParamsToJson(this);

  const CodeParams({
    required this.token,
    required this.code,
  });
}