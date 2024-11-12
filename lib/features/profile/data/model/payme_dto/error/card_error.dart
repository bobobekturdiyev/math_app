

import 'package:json_annotation/json_annotation.dart';



part 'card_error.g.dart';
@JsonSerializable()
class CardError{
  final String message;
  final int code;
  // final String? data;



  factory CardError.fromJson(Map<String, dynamic> json) =>
      _$CardErrorFromJson(json);

  Map<String, dynamic> toJson() => _$CardErrorToJson(this);

  const CardError({
    required this.message,
    required this.code,
    // required this.data,
  });
}