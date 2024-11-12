

import 'package:json_annotation/json_annotation.dart';



part 'card.g.dart';
@JsonSerializable()
class Card{
  final String number;
  final String expire;
  final String token;
  final bool recurrent;
  final bool verify;
  final String type;



  factory Card.fromJson(Map<String, dynamic> json) =>
      _$CardFromJson(json);

  Map<String, dynamic> toJson() => _$CardToJson(this);

  const Card({
    required this.number,
    required this.expire,
    required this.token,
    required this.recurrent,
    required this.verify,
    required this.type,
  });
}