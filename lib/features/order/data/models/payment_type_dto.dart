import 'package:json_annotation/json_annotation.dart';

part 'payment_type_dto.g.dart';

@JsonSerializable()
class PaymentTypeDto {
  final String value;
  final List<String> values;

  const PaymentTypeDto({
    required this.value,
    required this.values,
  });

  factory PaymentTypeDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTypeDtoToJson(this);
}
