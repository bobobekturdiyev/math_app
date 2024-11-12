

import 'package:json_annotation/json_annotation.dart';

import 'card_request.dart';

part 'card_pay_req.g.dart';

@JsonSerializable()
class CardPayReq{
  final String method;
  final CardRequest params;






  const CardPayReq({
    required this.method,
    required this.params,
  });

  factory CardPayReq.fromJson(Map<String, dynamic> json) =>
      _$CardPayReqFromJson(json);

  Map<String, dynamic> toJson() => _$CardPayReqToJson(this);


}