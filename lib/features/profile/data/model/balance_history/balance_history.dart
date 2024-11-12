

import 'package:json_annotation/json_annotation.dart';

part 'balance_history.g.dart';
@JsonSerializable()
class BalanceHistoryDto{
final int id;
final double amount;
@JsonKey(name: "payment_type")
final String paymentType;
@JsonKey(name: "payment_method")
final String paymentMethod;
final String description;




  factory BalanceHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$BalanceHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceHistoryDtoToJson(this);

const BalanceHistoryDto({
  required this.id,
  required this.amount,
  required this.paymentType,
  required this.paymentMethod,
  required this.description,
});

}