

import 'package:json_annotation/json_annotation.dart';


part 'about_req.g.dart';

@JsonSerializable()
class AboutReq{
  final String about;



  factory AboutReq.fromJson(Map<String, dynamic> json) =>
      _$AboutReqFromJson(json);

  AboutReq({required this.about});

  Map<String, dynamic> toJson() => _$AboutReqToJson(this);


}