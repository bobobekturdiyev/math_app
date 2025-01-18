import 'package:json_annotation/json_annotation.dart';

part 'card_number_dto.g.dart';

@JsonSerializable()
class CardNumberDto {
  @JsonKey(name: 'card_number')
  final String? cardNumber;

  const CardNumberDto({
    this.cardNumber,
  });

  factory CardNumberDto.fromJson(Map<String, dynamic> json) =>
      _$CardNumberDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CardNumberDtoToJson(this);
}
