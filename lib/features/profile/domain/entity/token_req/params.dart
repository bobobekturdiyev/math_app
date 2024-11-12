

import 'package:json_annotation/json_annotation.dart';



part 'params.g.dart';
@JsonSerializable()
class Params{
  final String token;




  factory Params.fromJson(Map<String, dynamic> json) =>
      _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);

  const Params({
    required this.token,
  });
}