

import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/profile/domain/entity/token_req/params.dart';



part 'token_req.g.dart';
@JsonSerializable()
class TokenReq{
  final String method;
  final Params params;





  factory TokenReq.fromJson(Map<String, dynamic> json) =>
      _$TokenReqFromJson(json);

  Map<String, dynamic> toJson() => _$TokenReqToJson(this);

  const TokenReq({
     this.method='cards.get_verify_code',
    required this.params,
  });
}