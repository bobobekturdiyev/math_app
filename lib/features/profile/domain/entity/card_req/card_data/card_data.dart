

import 'package:json_annotation/json_annotation.dart';

part 'card_data.g.dart';
@JsonSerializable()
class CardData{
  final String number;
  final String expire;






  factory CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);

  Map<String, dynamic> toJson() => _$CardDataToJson(this);

  const CardData({
    required this.number,
    required this.expire,
  });
}