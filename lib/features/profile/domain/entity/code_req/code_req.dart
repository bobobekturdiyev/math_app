

import 'package:json_annotation/json_annotation.dart';

import 'code_params.dart';



part 'code_req.g.dart';
@JsonSerializable()
class CodeReq{
  final String method;
  final CodeParams params;



  factory CodeReq.fromJson(Map<String, dynamic> json) =>
      _$CodeReqFromJson(json);

  Map<String, dynamic> toJson() => _$CodeReqToJson(this);

  const CodeReq({
     this.method="cards.verify",
    required this.params,
  });
}