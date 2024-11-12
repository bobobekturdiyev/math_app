

import 'package:json_annotation/json_annotation.dart';
import 'package:math_app/features/profile/data/model/payme_dto/succes/card_success.dart';

import 'error/card_error.dart';


part 'create_card_dto.g.dart';
@JsonSerializable()
class CardCreateDto{
  final CardSuccess? result;
  final CardError? error;



  factory CardCreateDto.fromJson(Map<String, dynamic> json) =>
      _$CardCreateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CardCreateDtoToJson(this);

  const CardCreateDto({
    this.result,
    this.error,
  });
}