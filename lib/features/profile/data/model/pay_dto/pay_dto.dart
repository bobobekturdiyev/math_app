

import 'package:json_annotation/json_annotation.dart';

part 'pay_dto.g.dart';
@JsonSerializable()
class PayDto{
  final bool success;
  final String message;
  final int code;




  factory PayDto.fromJson(Map<String, dynamic> json) =>
      _$PayDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PayDtoToJson(this);

  const PayDto({
    required this.success,
    required this.message,
    required this.code,
  });

}