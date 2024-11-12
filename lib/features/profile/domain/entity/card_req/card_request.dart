

import 'package:json_annotation/json_annotation.dart';

import 'card_data/card_data.dart';

part 'card_request.g.dart';

@JsonSerializable()
class CardRequest{
  final CardData card;
  final bool save;







  factory CardRequest.fromJson(Map<String, dynamic> json) =>
      _$CardRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CardRequestToJson(this);

  const CardRequest({
    required this.card,
    required this.save,
  });
}