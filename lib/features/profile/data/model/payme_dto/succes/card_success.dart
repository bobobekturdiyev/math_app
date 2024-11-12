

import 'package:json_annotation/json_annotation.dart';

import 'card.dart';



part 'card_success.g.dart';
@JsonSerializable()
class CardSuccess{
  final Card card;




  factory CardSuccess.fromJson(Map<String, dynamic> json) =>
      _$CardSuccessFromJson(json);

  Map<String, dynamic> toJson() => _$CardSuccessToJson(this);

  const CardSuccess({
    required this.card,
  });
}