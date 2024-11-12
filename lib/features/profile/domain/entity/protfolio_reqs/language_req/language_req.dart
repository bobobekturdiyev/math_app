

import 'package:json_annotation/json_annotation.dart';


part 'language_req.g.dart';

@JsonSerializable()
class LanguageReq{
  @JsonKey(name: 'language_name')
  final String lang;
  final String level;




  factory LanguageReq.fromJson(Map<String, dynamic> json) =>
      _$LanguageReqFromJson(json);

  LanguageReq({required this.lang, required this.level});


  Map<String, dynamic> toJson() => _$LanguageReqToJson(this);


}