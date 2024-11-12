

import 'package:json_annotation/json_annotation.dart';

part 'pay_request.g.dart';
@JsonSerializable()
class PayRequest{
  @JsonKey(name: 'plan_id')
  final int planId;





  factory PayRequest.fromJson(Map<String, dynamic> json) =>
      _$PayRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PayRequestToJson(this);

  const PayRequest({
    required this.planId,
  });
}